{{- define "name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create dockerconfig pull secret
*/}}
{{- define "dockerConfigSecret" }}
{{- with .Values.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" .registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}

{{/*
Return pull secret
*/}}
{{- define "imagePullSecrets" -}}
{{- if or .Values.imageCredentials.create .Values.imageCredentials.secretName }}
imagePullSecrets:
  - name: {{ .Values.imageCredentials.secretName | default (printf "%s-%s" .Release.Name "registry-credentials") }}
{{- end }}
{{- end }}

{{/*
Return the proper dbwait image name
*/}}
{{- define "dbwait.image" -}}
{{- $registryName := .Values.imageCredentials.registry -}}
{{- $repositoryName := .Values.imageCredentials.repository -}}
{{- $tag := .Values.dbwait.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "common.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ template "name" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{- end }}

{{/*
Render a compatible securityContext depending on the platform. By default it is maintained as it is. In other platforms like Openshift we remove default user/group values that do not work out of the box with the restricted-v1 SCC
Usage:
{{- include "common.compatibility.renderSecurityContext" (dict "secContext" .Values.containerSecurityContext "context" $) -}}
*/}}
{{- define "renderSecurityContext" -}}
{{- $adaptedContext := .secContext -}}
{{- if .context.Values.openShift.compatibility.adaptSecurityContext -}}
  {{/* Remove incompatible user/group values that do not work in Openshift out of the box */}}
  {{- $adaptedContext = omit $adaptedContext "fsGroup" "runAsUser" "runAsGroup" "runAsNonRoot" -}}
  {{- if not .secContext.seLinuxOptions -}}
    {{/* If it is an empty object, we remove it from the resulting context because it causes validation issues */}}
    {{- $adaptedContext = omit $adaptedContext "seLinuxOptions" -}}
  {{- end -}}
{{- end -}}
{{- $adaptedContext | toYaml -}}
{{- end -}}

{{/*
Proxy vars image scanner / cmd dispatcher
*/}}
{{- define "proxy.envs" }}
{{- if or (not .Values.multicluster.enabled) (and (.Values.multicluster.enabled) (eq .Values.multicluster.role "main")) }}
{{- $_ := set . "gatewayEndpoint" (printf "%s-gateway.%s" .Release.Name .Release.Namespace) }}
{{- else }}
{{- $_ := set . "gatewayEndpoint" .Values.multicluster.gateway.host }}
{{- end }}
{{- if .Values.proxy.httpProxy }}
- name: http_proxy
  value: {{ .Values.proxy.httpProxy | quote }}
- name: HTTP_PROXY
  value: {{ .Values.proxy.httpProxy | quote }}
{{- end }}
{{- if .Values.proxy.httpsProxy }}
- name: HTTPS_PROXY
  value: {{ .Values.proxy.httpsProxy | quote }}
{{- end }}
{{- if or .Values.proxy.httpProxy .Values.proxy.httpsProxy }}
- name: no_proxy
  value: {{ printf "%s,%s,%s,%s,%s,.%s,%s,%s,%s" ".svc" "localhost" "kubernetes" ".cluster.local" ".local" .Release.Namespace .gatewayEndpoint (lookup "v1" "Service" "default" "kubernetes").spec.clusterIP .Values.proxy.noProxy | quote }}
- name: NO_PROXY
  value: {{ printf "%s,%s,%s,%s,%s,.%s,%s,%s,%s" ".svc" "localhost" "kubernetes" ".cluster.local" ".local" .Release.Namespace .gatewayEndpoint (lookup "v1" "Service" "default" "kubernetes").spec.clusterIP .Values.proxy.noProxy | quote }}
{{- end }}
{{- end }}

{{/*
Logs vars for Go services
*/}}
{{- define "logFormat.envs" }}
- name: LOG_ENV
  value: {{ .Values.log.env | quote }}
- name: LOG_FORMAT
  value: {{ .Values.log.format | quote }}
- name: LOG_CONST_FIELDS
  value: {{ .Values.log.constFields | quote }}
- name: POD_NAME
  valueFrom:
    fieldRef:
      fieldPath: metadata.name
- name: NODE_NAME
  valueFrom:
    fieldRef:
      fieldPath: spec.nodeName
- name: LOG_FIELD_MAP
  value: {{ .Values.log.fieldMap | quote }}
{{- end }}