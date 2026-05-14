{{/*
Return Kafka host
*/}}
{{- define "kafkaHost" -}}
{{- if .Values.kafka.enabled -}}
{{- printf "%s-%s.%s:%s" .Release.Name "kafka" .Release.Namespace (include "kafkaPort" .) -}}
{{- else -}}
{{- printf "%s:%s" .Values.databaseConnectionConfiguration.kafka.host (include "kafkaPort" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return Kafka port
*/}}
{{- define "kafkaPort" -}}
{{- if .Values.kafka.enabled -}}
{{- printf "%s" "9092" -}}
{{- else -}}
{{- $port := .Values.databaseConnectionConfiguration.kafka.port | toString -}}
{{- printf "%s" .Values.databaseConnectionConfiguration.kafka.port -}}
{{- end -}}
{{- end -}}

{{/*
Return ClickHouse host
*/}}
{{- define "clickHouseHost" -}}
{{- if .Values.clickhouse.enabled -}}
{{- printf "%s-%s.%s" .Release.Name "clickhouse" .Release.Namespace -}}
{{- else -}}
{{- $clickHouseHost := .Values.databaseConnectionConfiguration.clickhouse.host -}}
{{- printf $clickHouseHost -}}
{{- end -}}
{{- end -}}

{{/*
Return Postgres's host
*/}}
{{- define "postgresHost" -}}
{{- if .Values.postgres.enabled -}}
{{- printf "%s-%s.%s" .Release.Name "postgres" .Release.Namespace -}}
{{- else -}}
{{- $postgresHost := .Values.databaseConnectionConfiguration.postgres.host -}}
{{- printf $postgresHost -}}
{{- end -}}
{{- end -}}

{{/*
Return Postgres's port
*/}}
{{- define "postgresPort" -}}
{{- if .Values.postgres.enabled -}}
{{- printf "%s" "5432" -}}
{{- else -}}
{{- $port := .Values.databaseConnectionConfiguration.postgres.port | toString -}}
{{- printf "%s" .Values.databaseConnectionConfiguration.postgres.port -}}
{{- end -}}
{{- end -}}

{{/*
Return Redis host
*/}}
{{- define "redisHost" -}}
{{- if .Values.redis.enabled -}}
{{- printf "%s-%s.%s:%s" .Release.Name "redis" .Release.Namespace (include "redisPort" .) -}}
{{- else -}}
{{- $redisHost := .Values.databaseConnectionConfiguration.redis.host -}}
{{- printf "%s:%s" $redisHost (include "redisPort" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return Redis port
*/}}
{{- define "redisPort" -}}
{{- if .Values.redis.enabled -}}
{{- printf "%s" "6379" -}}
{{- else -}}
{{- $redisPort := .Values.databaseConnectionConfiguration.redis.port | toString -}}
{{- printf $redisPort -}}
{{- end -}}
{{- end -}}

{{/*
Return exporter host
*/}}
{{- define "exporterHost" -}}
{{- if not .Values.multicluster.exporter.host -}}
{{- printf "%s-%s.%s:%s" .Release.Name "exporter" .Release.Namespace "3337" -}}
{{- else -}}
{{- printf "%s:%s" .Values.multicluster.exporter.host .Values.multicluster.exporter.port -}}
{{- end -}}
{{- end -}}

{{/*
Return networker host
*/}}
{{- define "networkerHost" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "networker" .Release.Namespace "12345" -}}
{{- end -}}

{{/*
Return watcher endpoint
*/}}
{{- define "watcherEndpoint" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "watcher" .Release.Namespace "8080" -}}
{{- end -}}

{{/*
Return watcher await endpoint
*/}}
{{- define "watcherAwaitEndpoint" -}}
{{- printf "%s://%s-%s.%s:%s/%s" "http" .Release.Name "watcher" .Release.Namespace "8080" "ready" -}}
{{- end -}}

{{/*
Return policier await endpoint
*/}}
{{- define "policierAwaitEndpoint" -}}
{{- printf "%s://%s-%s.%s:%s/%s" "http" .Release.Name "policier" .Release.Namespace "8080" "ready" -}}
{{- end -}}

{{/*
Return linker host
*/}}
{{- define "linkerPolicyHost" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "linker" .Release.Namespace "12346" -}}
{{- end -}}

{{- define "linkerLinksHost" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "linker" .Release.Namespace "12347" -}}
{{- end -}}

{{/*
Return collector endpoint
*/}}
{{- define "collectorEndpoint" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "collector" .Release.Namespace "31337" -}}
{{- end -}}

{{/*
Return dataprovider host
*/}}
{{- define "dataProviderEndpoint" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "data-provider" .Release.Namespace "80" -}}
{{- end -}}

{{/*
Return checker addr
*/}}
{{- define "checkerAddress" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "checker" .Release.Namespace "8080" -}}
{{- end -}}

{{/*
Return charon addr
*/}}
{{- define "charonAddress" -}}
{{- printf "%s://%s-%s.%s:%s" "http" .Release.Name "charon" .Release.Namespace "8080/ready" -}}
{{- end -}}

{{/*
Return cmd-dispatcher addr
*/}}
{{- define "commanderAddress" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "cmd-dispatcher" .Release.Namespace "8080" -}}
{{- end -}}

{{/*
Return lapi addr
*/}}
{{- define "lapiAddress" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "lapi" .Release.Namespace "8080" -}}
{{- end -}}

{{/*
Return sbom-scanner addr
*/}}
{{- define "registryScannerAddress" -}}
{{- printf "%s-%s.%s:%s" .Release.Name "registry-scanner" .Release.Namespace "8080" -}}
{{- end -}}

{{/*
Return cronjob apiversion
*/}}
{{- define "cronJobApiVersion" -}}
{{- if .Capabilities.APIVersions.Has "batch/v1/CronJob" -}}
{{- printf "batch/v1" -}}
{{- else -}}
{{- printf "batch/v1beta1" -}}
{{- end -}}
{{- end -}}

{{/*
Return gateway endpoint
*/}}
{{- define "gatewayEndpoint" -}}
{{- if or (not .Values.multicluster.enabled) (and (.Values.multicluster.enabled) (eq .Values.multicluster.role "main")) -}}
  {{ .Release.Name }}-gateway.{{ .Release.Namespace }}:{{ .Values.gateway.service.port }}
{{- else if and (.Values.multicluster.enabled) (eq .Values.multicluster.role "secondary") -}}
  {{ .Values.multicluster.gateway.host }}:{{ .Values.multicluster.gateway.port }}
{{- end -}}
{{- end -}}

{{/*
Return vulndb address
*/}}
{{- define "vulndbAddress" -}}
{{- if .Values.vulndb.address -}}
{{- printf .Values.vulndb.address -}}
{{- else }}
{{- printf "%s://%s-%s.%s:%s" "http" .Release.Name "vulndb" .Release.Namespace "8080" -}}
{{- end -}}
{{- end -}}
