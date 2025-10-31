{{/*
PG host port db ssl envs
*/}}
{{- define "postgres.hostPortDbSsl" -}}
- name: POSTGRES_HOST
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: POSTGRES_HOST
- name: POSTGRES_PORT
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: POSTGRES_PORT
- name: POSTGRES_DB
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: POSTGRES_DB
- name: POSTGRES_SCHEMA
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: POSTGRES_SCHEMA
- name: PG_SSL_ENABLE
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: POSTGRES_SSL_REQUIRED
- name: PG_SSL_CA_PATH
  value: /usr/share/ca-certificates/pg-ca.crt
{{- end -}}

{{/*
PG PODS envs
*/}}
{{- define "postgres.envs" -}}
{{- $postgresSecretName := .Values.databaseConnectionConfiguration.postgres.customSecret.secretName -}}
{{- if and .Values.databaseConnectionConfiguration.postgres.bankVaultsInjector.enabled .Values.databaseConnectionConfiguration.postgres.customSecret.secretName }}
{{- fail "\n You only need to select one method for storing database credentials" }}
{{- end }}
{{- if .Values.databaseConnectionConfiguration.postgres.bankVaultsInjector.enabled }}
- name: POSTGRES_USER
  value: {{ .Values.databaseConnectionConfiguration.postgres.bankVaultsInjector.userKey }}
- name: POSTGRES_PASSWORD
  value: {{ .Values.databaseConnectionConfiguration.postgres.bankVaultsInjector.passwordKey }}
{{- else -}}
- name: POSTGRES_USER
  valueFrom:
    secretKeyRef:
      name: {{ default (printf "%s-%s" .Release.Name "postgres-auth") $postgresSecretName }}
      key: {{ default "POSTGRES_USER" .Values.databaseConnectionConfiguration.postgres.customSecret.userKey }}
- name: POSTGRES_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ default (printf "%s-%s" .Release.Name "postgres-auth") $postgresSecretName }}
      key: {{ default "POSTGRES_PASSWORD" .Values.databaseConnectionConfiguration.postgres.customSecret.passwordKey }}
{{- end -}}
{{- end -}}

{{/*
KAFKA PODS envs
*/}}
{{- define "kafka.envs" -}}
{{- $kafkaSecretName := .Values.databaseConnectionConfiguration.kafka.customSecret.secretName -}}
{{- if and .Values.databaseConnectionConfiguration.kafka.bankVaultsInjector.enabled .Values.databaseConnectionConfiguration.kafka.customSecret.secretName }}
{{- fail "\n You only need to select one method for storing database credentials" }}
{{- end -}}
- name: KAFKA_ADDR
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: KAFKA_ADDR
- name: KAFKA_AUTH_MECHANISM
  value: {{ .Values.databaseConnectionConfiguration.kafka.authMechanism | quote }}
- name: KAFKA_SECURITY_PROTOCOL
  value: {{ include "kafka.security.protocol" . | quote }}
{{- if .Values.databaseConnectionConfiguration.kafka.bankVaultsInjector.enabled }}
- name: KAFKA_CLIENT_USER
  value: {{ .Values.databaseConnectionConfiguration.kafka.bankVaultsInjector.userKey }}
- name: KAFKA_CLIENT_PASSWORD
  value: {{ .Values.databaseConnectionConfiguration.kafka.bankVaultsInjector.passwordKey }}
{{- else }}
- name: KAFKA_CLIENT_USER
  valueFrom:
    secretKeyRef:
      name: {{ default (printf "%s-%s" .Release.Name "kafka-auth") $kafkaSecretName }}
      key: {{ default "KAFKA_CLIENT_USER" .Values.databaseConnectionConfiguration.kafka.customSecret.userKey }}
- name: KAFKA_CLIENT_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ default (printf "%s-%s" .Release.Name "kafka-auth") $kafkaSecretName }}
      key: {{ default "KAFKA_CLIENT_PASSWORD" .Values.databaseConnectionConfiguration.kafka.customSecret.passwordKey }}
{{- end -}}
{{- if .Values.databaseConnectionConfiguration.kafka.ssl.enabled }}
- name: KAFKA_USE_SSL
  value: {{ .Values.databaseConnectionConfiguration.kafka.ssl.enabled | quote }}
- name: KAFKA_SKIP_VERIFY
  value: {{ .Values.databaseConnectionConfiguration.kafka.ssl.skipVerify | quote }}
- name: KAFKA_SSL_CA_PATH
  value: /usr/share/ca-certificates/kafka-ca.crt
{{- end -}}
{{- end -}}

{{- define "kafka.security.protocol" -}}
{{- if .Values.databaseConnectionConfiguration.kafka.ssl.enabled }}
{{- printf "SASL_SSL" -}}
{{- else }}
{{- printf "SASL_PLAINTEXT" -}}
{{- end }}
{{- end }}

{{/*
Return ClickHouse Host DB
*/}}
{{- define "clickhouse.HostDb" -}}
- name: CLICKHOUSE_HOST
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: CLICKHOUSE_HOST
- name: CLICKHOUSE_DB
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-luntry-config
      key: CLICKHOUSE_DB
{{- end -}}

{{/*
CLICKHOUSE PODS envs
*/}}
{{- define "clickhouse.envs" -}}
{{- $clickhouseSecretName := .Values.databaseConnectionConfiguration.clickhouse.customSecret.secretName -}}
{{- if and .Values.databaseConnectionConfiguration.clickhouse.bankVaultsInjector.enabled .Values.databaseConnectionConfiguration.clickhouse.customSecret.secretName -}}
{{- fail "\n You only need to select one method for storing database credentials" }}
{{- end }}
{{- if .Values.databaseConnectionConfiguration.clickhouse.bankVaultsInjector.enabled -}}
- name: CLICKHOUSE_USER
  value: {{ .Values.databaseConnectionConfiguration.clickhouse.bankVaultsInjector.userKey }}
- name: CLICKHOUSE_PASSWORD
  value: {{ .Values.databaseConnectionConfiguration.clickhouse.bankVaultsInjector.passwordKey }}
{{- else -}}
- name: CLICKHOUSE_USER
  valueFrom:
    secretKeyRef:
      name: {{ default (printf "%s-%s" .Release.Name "clickhouse-auth") $clickhouseSecretName }}
      key: {{ default "CLICKHOUSE_USER" .Values.databaseConnectionConfiguration.clickhouse.customSecret.userKey }}
- name: CLICKHOUSE_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ default (printf "%s-%s" .Release.Name "clickhouse-auth") $clickhouseSecretName }}
      key: {{ default "CLICKHOUSE_PASSWORD" .Values.databaseConnectionConfiguration.clickhouse.customSecret.passwordKey }}
{{- end -}}
{{- end -}}

{{/*
Redis PODS pass
*/}}
{{- define "redis.pass" -}}
{{- $redisSecretName := .Values.databaseConnectionConfiguration.redis.customSecret.secretName -}}
{{- if and .Values.databaseConnectionConfiguration.redis.bankVaultsInjector.enabled .Values.databaseConnectionConfiguration.redis.customSecret.secretName -}}
{{- fail "\n You only need to select one method for storing database credentials" }}
{{- end }}
{{- if .Values.databaseConnectionConfiguration.redis.bankVaultsInjector.enabled -}}
- name: REDIS_PASSWORD
  value: {{ .Values.databaseConnectionConfiguration.redis.bankVaultsInjector.passwordKey }}
{{- else if or .Values.databaseConnectionConfiguration.redis.password $redisSecretName -}}
- name: REDIS_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ default (printf "%s-%s" .Release.Name "redis-auth") $redisSecretName }}
      key: {{ default "REDIS_PASSWORD" .Values.databaseConnectionConfiguration.redis.customSecret.passwordKey }}
{{- else -}}
- name: REDIS_PASSWORD
  value: ""
{{- end -}}
{{- end -}}
