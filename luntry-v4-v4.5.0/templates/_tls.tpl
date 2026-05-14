{{/*
CA bundle mount
*/}}
{{- define "caBundle.volume" -}}
{{- if or .Values.caBundle.crtBase64 .Values.caBundle.secretName }}
- name: ca-bundle
  secret:
    secretName: {{ .Values.caBundle.secretName | default (printf "%s-%s" .Release.Name "ca-bundle") }}
    items:
      - key: luntry-bundle.crt
        path: luntry-bundle
{{- end }}
{{- end }}

{{- define "caBundle.volumeMount" -}}
{{- if or .Values.caBundle.crtBase64 .Values.caBundle.secretName }}
- name: ca-bundle
  mountPath: "/usr/share/ca-certificates/ca-bundle.crt"
  subPath: luntry-bundle
{{- end }}
{{- end }}

{{/*
PG TLS mount
*/}}
{{- define "pg.tls.volume" -}}
{{- if .Values.databaseConnectionConfiguration.postgres.tls.enabled }}
- name: pg-ca
  secret:
    secretName: {{ .Values.databaseConnectionConfiguration.postgres.tls.ca.secretName | default (printf "%s-%s" .Release.Name "pg-tls-ca") }}
    items:
      - key: {{ .Values.databaseConnectionConfiguration.postgres.tls.ca.secretKey | default "ca.crt" }}
        path: pg-ca
{{- end }}
{{- end }}

{{- define "pg.tls.volumeMount" -}}
{{- if .Values.databaseConnectionConfiguration.postgres.tls.enabled }}
- name: pg-ca
  mountPath: "/usr/share/ca-certificates/pg-ca.crt"
  subPath: pg-ca
{{- end }}
{{- end }}

{{/*
KAFKA SSL mount
*/}}
{{- define "kafka.ssl.volume" -}}
{{- if .Values.databaseConnectionConfiguration.kafka.ssl.enabled }}
- name: kafka-ca
  secret:
    secretName: {{ .Values.databaseConnectionConfiguration.kafka.ssl.ca.secretName | default (printf "%s-%s" .Release.Name "kafka-ssl-ca") }}
    items:
      - key: {{ .Values.databaseConnectionConfiguration.kafka.ssl.ca.secretKey | default "ca.crt" }}
        path: kafka-ca
{{- end }}
{{- end }}

{{- define "kafka.ssl.volumeMount" -}}
{{- if .Values.databaseConnectionConfiguration.kafka.ssl.enabled }}
- name: kafka-ca
  mountPath: "/usr/share/ca-certificates/kafka-ca.crt"
  subPath: kafka-ca
{{- end }}
{{- end }}

{{/*
GATEWAY TLS mount
*/}}
{{- define "gateway.tls.volume" -}}
{{- if .Values.gateway.tls.enabled }}
- name: gateway-ca
  secret:
    secretName: {{ .Values.gateway.tls.ca.secretName | default (printf "%s-%s" .Release.Name "gateway-ca") }}
    items:
      - key: {{ .Values.gateway.tls.ca.secretKey | default "ca.crt" }}
        path: gateway-ca
{{- end }}
{{- end }}

{{- define "gateway.tls.volumeMount" -}}
{{- if .Values.gateway.tls.enabled }}
- name: gateway-ca
  mountPath: "/usr/share/ca-certificates/gateway-ca.crt"
  subPath: gateway-ca
{{- end }}
{{- end }}

{{/*
EXPORTER TLS mount
*/}}
{{- define "exporter.tls.volume" -}}
{{- if .Values.exporter.tls.enabled }}
- name: exporter-ca
  secret:
    secretName: {{ .Values.exporter.tls.ca.secretName | default (printf "%s-%s" .Release.Name "exporter-ca") }}
    items:
      - key: {{ .Values.exporter.tls.ca.secretKey | default "ca.crt" }}
        path: exporter-ca
{{- end }}
{{- end }}

{{- define "exporter.tls.volumeMount" -}}
{{- if .Values.exporter.tls.enabled }}
- name: exporter-ca
  mountPath: "/usr/share/ca-certificates/exporter-ca.crt"
  subPath: exporter-ca
{{- end }}
{{- end }}

{{/*
CMD-DISPATCHER TLS mount
*/}}
{{- define "cmd-dispatcher.tls.volume" -}}
{{- if .Values.cmdDispatcher.tls.enabled }}
- name: cmd-dispatcher-ca
  secret:
    secretName: {{ .Values.cmdDispatcher.tls.ca.secretName | default (printf "%s-%s" .Release.Name "cmd-dispatcher-ca") }}
    items:
      - key: {{ .Values.cmdDispatcher.tls.ca.secretKey | default "ca.crt" }}
        path: cmd-dispatcher-ca
{{- end }}
{{- end }}

{{- define "cmd-dispatcher.tls.volumeMount" -}}
{{- if .Values.cmdDispatcher.tls.enabled }}
- name: cmd-dispatcher-ca
  mountPath: "/usr/share/ca-certificates/cmd-dispatcher-ca.crt"
  subPath: cmd-dispatcher-ca
{{- end }}
{{- end }}

{{/*
Data Provider CA mount
*/}}
{{- define "dataProvider.ca.volume" -}}
{{- if or .Values.dataProvider.ca.crtBase64 (and .Values.dataProvider.ca.secretName .Values.dataProvider.ca.secretKey) }}
- name: data-provider-ca
  secret:
    secretName: {{ .Values.dataProvider.ca.secretName | default (printf "%s-%s" .Release.Name "data-provider-ca") }}
    items:
    {{- if .Values.dataProvider.ca.secretKey }}
      - key: {{ .Values.dataProvider.ca.secretKey  }}
        path: {{ .Values.dataProvider.ca.secretKey }}
    {{- else }}
      - key: ca.crt
        path: ca.crt
    {{- end }}
{{- end }}
{{- end }}

{{- define "dataProvider.ca.volumeMount" -}}
{{- if or .Values.dataProvider.ca.crtBase64 (and .Values.dataProvider.ca.secretName .Values.dataProvider.ca.secretKey) }}
- name: data-provider-ca
  mountPath: "/opt/CA/{{ .Values.dataProvider.ca.secretKey | default "ca.crt" }}"
  subPath: {{ .Values.dataProvider.ca.secretKey | default "ca.crt" }}
  readOnly: true
{{- end }}
{{- end }}