## Values

### imagePullSecret

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| imageCredentials.create | bool | `true` | Создание imagePullSecret |
| imageCredentials.secretName | string | `""` | Название секрета |
| imageCredentials.registry | string | `"registry.luntry.com"` | Доменное имя или адрес локального registry |
| imageCredentials.repository | string | `"luntry"` | Имя репозитория или проекта в registry |
| imageCredentials.username | string | `""` | Имя пользователя для доступа к registry |
| imageCredentials.password | string | `""` | Пароль пользователя |
| imageCredentials.email | string | `"robot@luntry.com"` | Email |

### Openshift compatibility

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| openShift.compatibility.adaptSecurityContext | bool | `false` | Адаптирует SecurityContext ресурсов для Openshift (удаляет поля runAsUser, runAsGroup, fsGroup) |
| openShift.compatibility.clickhouseInitFix | bool | `false` | Изменяет init скрипт контейнера Clickhouse для работы с кастомным UID |
| openShift.compatibility.sensorPrivilegedScc | bool | `false` | Автоматически назначает SCC privileged для SA luntry-sensor "sensor.serviceAccount.create" должен быть включен |
| openShift.compatibility.compliancePrivilegedScc | bool | `false` | Автоматически назначает SCC privileged для SA luntry-compliance "complianceOperator.serviceAccount.create" должен быть включен |
| openShift.compatibility.complianceCisBenchmark | bool | `false` | Использование CIS Openshift Benchmark |
| openShift.compatibility.customPrivilegedScc | bool | `false` | Создает новый SCC с именем luntry-privileged и назначает его на SA luntry-sensor и luntry-compliance |

### databaseConnectionConfiguration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| databaseConnectionConfiguration.bankVaultsInjectorAnnotations | object | `{}` | Аннотации для добавления в Deployment сервисов, которые используют БД |
| databaseConnectionConfiguration.clickhouse.host | string | "ReleaseName-clickhouse.ReleaseNamespace" | Адрес сервера |
| databaseConnectionConfiguration.clickhouse.portHTTP | string | 8123 | HTTP порт |
| databaseConnectionConfiguration.clickhouse.portTCP | string | 9000 | TCP порт |
| databaseConnectionConfiguration.clickhouse.dbName | string | luntry | Имя БД |
| databaseConnectionConfiguration.clickhouse.username | string | collector | Имя пользователя БД |
| databaseConnectionConfiguration.clickhouse.password | string | 123QWEasd | Пароль пользователя БД |
| databaseConnectionConfiguration.clickhouse.customSecret.secretName | string | `""` | Имя существующего секрета |
| databaseConnectionConfiguration.clickhouse.customSecret.userKey | string | `""` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.clickhouse.customSecret.passwordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.clickhouse.bankVaultsInjector.enabled | bool | `false` | Включение использования [Bank-Vaults Secret injection webhook](https://bank-vaults.dev/docs/mutating-webhook/) |
| databaseConnectionConfiguration.clickhouse.bankVaultsInjector.userKey | string | `""` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.clickhouse.bankVaultsInjector.passwordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.kafka.host | string | "ReleaseName-kafka.ReleaseNamespace" | Адрес сервера |
| databaseConnectionConfiguration.kafka.port | string | 9092 | Порт |
| databaseConnectionConfiguration.kafka.username | string | luntry | Имя пользователя БД |
| databaseConnectionConfiguration.kafka.password | string | 1A5nzldlz1psgwcG | Пароль пользователя БД |
| databaseConnectionConfiguration.kafka.authMechanism | string | `""` | Механизм аутентификации SCRAM-SHA-256, SCRAM-SHA-512 или "" для PLAIN |
| databaseConnectionConfiguration.kafka.ssl.enabled | bool | `false` | Включает использование SSL для подключения к БД |
| databaseConnectionConfiguration.kafka.ssl.skipVerify | bool | `false` | Пропускать верификацию SSL сертификата |
| databaseConnectionConfiguration.kafka.ssl.ca.crtBase64 | string | `""` | СА цепочка в Base64 формате |
| databaseConnectionConfiguration.kafka.ssl.ca.secretName | string | `""` | Имя существующего секрета |
| databaseConnectionConfiguration.kafka.ssl.ca.secretKey | string | `""` | Ключ содержащий сертификат |
| databaseConnectionConfiguration.kafka.customSecret.secretName | string | `""` | Имя существующего секрета |
| databaseConnectionConfiguration.kafka.customSecret.userKey | string | `"KAFKA_CLIENT_USER"` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.kafka.customSecret.passwordKey | string | `"KAFKA_CLIENT_PASSWORD"` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.kafka.customSecret.interBrokerUserKey | string | `"KAFKA_INTER_BROKER_USER"` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.kafka.customSecret.interBrokerPasswordKey | string | `"KAFKA_INTER_BROKER_PASSWORD"` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.kafka.customSecret.controllerUserKey | string | `"KAFKA_CONTROLLER_USER"` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.kafka.customSecret.controllerPasswordKey | string | `"KAFKA_CONTROLLER_PASSWORD"` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.kafka.bankVaultsInjector.enabled | bool | `false` | Включение использования [Bank-Vaults Secret injection webhook](https://bank-vaults.dev/docs/mutating-webhook/) |
| databaseConnectionConfiguration.kafka.bankVaultsInjector.userKey | string | `""` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.kafka.bankVaultsInjector.passwordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.kafka.bankVaultsInjector.interBrokerUserKey | string | `""` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.kafka.bankVaultsInjector.interBrokerPasswordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.kafka.bankVaultsInjector.controllerUserKey | string | `""` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.kafka.bankVaultsInjector.controllerPasswordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.postgres.host | string | "ReleaseName-postgres.ReleaseNamespace" | Адрес сервера |
| databaseConnectionConfiguration.postgres.port | string | 5432 | Порт |
| databaseConnectionConfiguration.postgres.dbName | string | `"collector"` | Имя БД |
| databaseConnectionConfiguration.postgres.schemaName | string | `"public"` | Имя схемы БД |
| databaseConnectionConfiguration.postgres.username | string | `"collector"` | Имя пользователя БД |
| databaseConnectionConfiguration.postgres.password | string | `"123QWEasd"` | Пароль пользователя БД |
| databaseConnectionConfiguration.postgres.customSecret.secretName | string | `""` | Имя существующего секрета |
| databaseConnectionConfiguration.postgres.customSecret.userKey | string | `""` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.postgres.customSecret.passwordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.postgres.bankVaultsInjector.enabled | bool | `false` | Включение использования [Bank-Vaults Secret injection webhook](https://bank-vaults.dev/docs/mutating-webhook/) |
| databaseConnectionConfiguration.postgres.bankVaultsInjector.userKey | string | `""` | Ключ содержащий имя учётной записи |
| databaseConnectionConfiguration.postgres.bankVaultsInjector.passwordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.postgres.tls.enabled | bool | `false` | Включает использование TLS для подключения к БД |
| databaseConnectionConfiguration.postgres.tls.ca.crtBase64 | string | `""` | СА цепочка в Base64 формате |
| databaseConnectionConfiguration.postgres.tls.ca.secretName | string | `""` | Имя существующего секрета |
| databaseConnectionConfiguration.postgres.tls.ca.secretKey | string | `""` | Ключ содержащий сертификат |
| databaseConnectionConfiguration.redis.host | string | "ReleaseName-redis.ReleaseNamespace" | Адрес сервера |
| databaseConnectionConfiguration.redis.port | string | 6379 | Порт |
| databaseConnectionConfiguration.redis.password | string | `""` | Пароль пользователя БД |
| databaseConnectionConfiguration.redis.customSecret.secretName | string | `""` | Имя существующего секрета |
| databaseConnectionConfiguration.redis.customSecret.passwordKey | string | `""` | Ключ содержащий пароль учётной записи |
| databaseConnectionConfiguration.redis.bankVaultsInjector.enabled | bool | `false` | Включение использования [Bank-Vaults Secret injection webhook](https://bank-vaults.dev/docs/mutating-webhook/) |
| databaseConnectionConfiguration.redis.bankVaultsInjector.passwordKey | string | `""` | Ключ содержащий пароль учётной записи |

### Параметры обучения

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| policy.autoTraining | bool | `false` | Включение автоматического обучения |
| policy.onlyFullLifecycle | bool | `false` | Старт обучения только если видели старт контейнера в поде, работает только при включенном автообучении |
| policy.trainingTime | int | `120` | Размер окна обучения в секундах |
| policy.archiveTime | int | `86400` | Интервал архивирования неактивных политик в секундах |
| policy.anomaliesEnabled.file | bool | `true` | Отключает обработку файловых событий |
| policy.anomaliesEnabled.network | bool | `true` | Отключает обработку сетевых событий |
| policy.anomaliesEnabled.process | bool | `true` | Отключает обработку процессных событий |
| policy.excludedNamespaces | string | `""` | Список неймспейсов, разделенных запятыми, в которых отключено автообучение, работает только при включенном автообучении |

### Прокси сервер

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| proxy.httpProxy | string | `""` | Адрес прокси сервера для HTTP запросов |
| proxy.httpsProxy | string | `""` | Адрес прокси сервера для HTTPS запросов |
| proxy.noProxy | string | `""` | Лист имен и адресов, разделенных запятыми,которые не должны проксироваться. Допускаются * По умолчанию содержит: .cluster.local,.local,.%Release.Namespace%,%gatewayEndpoint% Данная переменная всегда должна включать адрес сервиса kubernetes.default в формате IP адреса |

### Веб-интерфейс

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin.user | string | `"luntry"` | Имя пользователя для входа в веб-интерфейс |
| admin.password | string | `"luntry_pass"` | Пароль пользователя для входа в веб-интерфейс |
| admin.idleLogoutTimeout | int | `1` | Время жизни сессии в часах |

### multicluster setup

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| multicluster.enabled | bool | `false` | Включение multicluster установки |
| multicluster.role | string | `"main"` | Выбор multicluster роли |
| multicluster.clusterName | string | `"main"` | Имя кластера (имена всех кластеров должны быть уникальны) |
| multicluster.clusterDescription | string | `""` | Описание кластера |
| multicluster.exporter.host | string | `""` | Адрес или доменное имя exporter в мастер-кластере |
| multicluster.exporter.port | string | `""` | Порт exporter в мастер-кластере |
| multicluster.gateway.host | string | `""` | Адрес или доменное имя gateway в мастер-кластере |
| multicluster.gateway.port | string | `""` | Порт gateway в мастер-кластере |
| multicluster.cmdDispatcher.host | string | `""` | Адрес или доменное имя cmdDispatcher в мастер-кластере |
| multicluster.cmdDispatcher.port | string | `""` | Порт cmdDispatcher в мастер-кластере |

### caBundle

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| caBundle.crtBase64 | string | `""` | СА цепочка в Base64 формате |
| caBundle.secretName | string | `""` | Имя существующего секрета, содержащего цепочку сертификатов |

### Logging

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| log.env | string | `"PROD"` | Имя среды, будет добавлено в поле env json лога |
| log.format | string | `"json"` | Формат лога |
| log.constFields | string | `"env:@LOG_ENV,system:luntry,inst:@NODE_NAME,pod_name:@POD_NAME"` | Константные поля в json логе |
| log.fieldMap | string | `""` | Позволяет изменить имена стандартных полей. Пример "time:@timestamp,msg:message,level:LEVEL,func:method,file:source" |

### Postgres

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgres.enabled | bool | `false` | Включает деплой PostgreSQL вместе с Luntry. Только для тестирования в небольших кластерах! |
| postgres.mode | string | `"deployment"` | Тип развёртывания |
| postgres.image.registry | string | `""` | Путь к registry с образом |
| postgres.image.name | string | `"luntry/3dparty/postgres"` | Имя проекта и образа |
| postgres.image.tag | string | `"14-trixie"` | Тэг образа |
| postgres.pvc.type | string | `"pvc"` | Тип хранилища |
| postgres.pvc.storageClass | string | `""` | Имя существующего StorageClass |
| postgres.pvc.size | string | `"50Gi"` | Размер хранилища |
| postgres.pvc.accessMode | string | `"ReadWriteOnce"` | Режимы доступа к хранилищу |
| postgres.pv.enabled | bool | `false` | Включает создание local storage PV при установке |
| postgres.pv.localPath | string | `"/opt/luntry-postgres"` | Путь на ноде для хранения данных PV (Путь должен быть предварительно создан на ноде) |
| postgres.pv.storageClass.create | bool | `false` | Создать local-only StorageClass при создании локального PV |
| postgres.pv.storageClass.name | string | `""` | Использовать существующий local-only StorageClass для локального PV |
| postgres.pv.reclaimPolicy | string | `"Recycle"` | Политика переиспользования PV, для сохранения данных в случае удаления, используйте "Retain" |
| postgres.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| postgres.tolerations | list | `[]` | Позволяет задавать tolerations для компонентов |
| postgres.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| postgres.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| postgres.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| postgres.resourcesPreset | string | `"none"` | Пресет ресурсов |
| postgres.resources | object | `{"limits":{"cpu":"2000m","memory":"2Gi"},"requests":{"cpu":"1000m","memory":"1Gi"}}` | Запросы / лимиты ресурсов |
| postgres.service.type | string | `"ClusterIP"` | Тип kubernetes сервиса |
| postgres.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":999}` | Container securityContext |
| postgres.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| postgres.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| postgres.podSecurityContext | object | `{"fsGroup":999,"fsGroupChangePolicy":"Always"}` | Pod securityContext |

### Charon

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| charon.enabled | bool | `true` | Включает деплой сервиса |
| charon.log.logLevel | string | `"info"` | Уровень логирования |
| charon.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| charon.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| charon.cruiseIntervalDuration | string | `"1m"` | Интервал запуска проверки ресурсов |
| charon.sensorLastSeenToKillDuration | string | `"30m"` | Период неактивности после которого сенсор будет помечен как deleted |
| charon.nodeLastSeenAtToRemoveDuration | string | `"30m"` | Период неактивности после которого нода будет помечен как deleted |
| charon.sensorLastSeenToKillContainerDuration | string | `"1h"` | Период неактивности после которого контейнеры будут помечены как deleted |
| charon.image.tag | string | `""` | Тэг образа |
| charon.image.name | string | `"charon"` | Имя образа |
| charon.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| charon.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| charon.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| charon.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| charon.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| charon.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| charon.resourcesPreset | string | `"none"` | Пресет ресурсов |
| charon.resources | object | `{"limits":{"cpu":"100m","memory":"100Mi"},"requests":{"cpu":"50m","memory":"50Mi"}}` | Запросы / лимиты ресурсов |
| charon.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| charon.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| charon.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| charon.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Checker

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| checker.enabled | bool | `true` | Включает деплой сервиса |
| checker.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| checker.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| checker.image.tag | string | `""` | Тэг образа |
| checker.image.name | string | `"checker"` | Имя образа |
| checker.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| checker.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| checker.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| checker.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| checker.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| checker.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| checker.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| checker.resourcesPreset | string | `"none"` | Пресет ресурсов |
| checker.resources | object | `{"limits":{"cpu":"1000m","memory":"500Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Запросы / лимиты ресурсов |
| checker.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| checker.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| checker.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| checker.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Collector

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| collector.enabled | bool | `true` | Включает деплой сервиса |
| collector.log.logLevel | string | `"info"` | Уровень логирования |
| collector.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| collector.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| collector.maxMsgSize | int | `10485760` | Устанавливает максимальный размер одного сообщения передаваемое сервису gateway. Значение по умолчанию - 10Мб |
| collector.pendingEventsLimit | int | `20000` | Устанавливает размер локальной очереди событий ожидающих обработки |
| collector.fallbackBuffer.type | string | `"local"` | Устанавливает тип фоллбэк буфера  |
| collector.fallbackBuffer.local.bufferSize | int | `100` | Максимальное количество файлов для локального буфера |
| collector.fallbackBuffer.local.eventsPerFile | int | `6000` | Максимальное количество событий в одном файле |
| collector.fallbackBuffer.local.memoryLimit | int | `2500` | Максимальный суммарный объем файлов в Мб, не должен превышать размера директории (collector.pvc.size=3Gi) |
| collector.replicas | int | `2` | Количество реплик |
| collector.image.tag | string | `""` | Тэг образа |
| collector.image.name | string | `"gcollector"` | Имя образа |
| collector.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| collector.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| collector.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| collector.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| collector.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| collector.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| collector.resourcesPreset | string | `"none"` | Пресет ресурсов |
| collector.resources | object | `{"limits":{"cpu":"2000m","memory":"3Gi"},"requests":{"cpu":"200m","memory":"500Mi"}}` | Запросы / лимиты ресурсов |
| collector.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | PodDisruptionBudget |
| collector.hpa | object | `{"cpu":{"avgUsage":70},"enabled":false,"maxReplicas":10,"memory":{"avgUsage":70},"minReplicas":1,"stabilizationWindow":300}` | Horizontal Pod Autoscaler |
| collector.pvc.type | string | `"emptydir"` | Тип хранилища |
| collector.pvc.storageClass | string | `""` | Имя существующего StorageClass |
| collector.pvc.size | string | `"3Gi"` | Размер хранилища |
| collector.pvc.accessMode | string | `"ReadWriteOnce"` | Режимы доступа к хранилищу |
| collector.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| collector.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| collector.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |

### Clickhouse

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clickhouse.enabled | bool | `true` | Включает деплой сервиса |
| clickhouse.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| clickhouse.image.registry | string | `""` | Путь к registry с образом |
| clickhouse.image.name | string | `"luntry/3dparty/clickhouse-server"` | Имя проекта и образа |
| clickhouse.image.tag | string | `"25.9"` | Тэг образа |
| clickhouse.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| clickhouse.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| clickhouse.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| clickhouse.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| clickhouse.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| clickhouse.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| clickhouse.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Container securityContext |
| clickhouse.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| clickhouse.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| clickhouse.podSecurityContext | object | `{"fsGroup":1001,"fsGroupChangePolicy":"Always"}` | Pod securityContext |
| clickhouse.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| clickhouse.resourcesPreset | string | `"none"` | Пресет ресурсов |
| clickhouse.resources | object | `{"limits":{"cpu":"1000m","memory":"2Gi"},"requests":{"cpu":"1000m","memory":"2Gi"}}` | Запросы / лимиты ресурсов |
| clickhouse.pvc.type | string | `"pvc"` | Тип хранилища |
| clickhouse.pvc.storageClass | string | `""` | Имя существующего StorageClass |
| clickhouse.pvc.size | string | `"10Gi"` | Размер хранилища |
| clickhouse.pvc.accessMode | string | `"ReadWriteOnce"` | Режимы доступа к хранилищу |
| clickhouse.pv.enabled | bool | `false` | Включает создание local storage PV при установке |
| clickhouse.pv.localPath | string | `"/opt/luntry-clickhouse"` | Путь на ноде для хранения данных PV (Путь должен быть предварительно создан на ноде) |
| clickhouse.pv.storageClass.create | bool | `true` | Создать local-only StorageClass при создании локального PV |
| clickhouse.pv.storageClass.name | string | `""` | Использовать существующий local-only StorageClass для локального PV |
| clickhouse.pv.reclaimPolicy | string | `"Recycle"` | Политика переиспользования PV, для сохранения данных в случае удаления, используйте "Retain" |

### complianceOperator

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| complianceOperator.mode | object | `{"cluster":true,"masterNode":true,"workerNode":true}` | Включает деплой сервиса |
| complianceOperator.mode.cluster | bool | `true` | Включение установки Deployment Compliance Operator |
| complianceOperator.mode.masterNode | bool | `true` | Включение установки DaemonSet Compliance Operator на мастер ноды кластера |
| complianceOperator.mode.workerNode | bool | `true` | Включение установки DaemonSet Compliance Operator на воркер ноды кластера |
| complianceOperator.log.logLevel | string | `"info"` | Уровень логирования |
| complianceOperator.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| complianceOperator.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| complianceOperator.cron | string | `"0 4 * * *"` | Интервал проведения проверок, данная переменная поддерживает стандартный cron синтаксис |
| complianceOperator.maxReportedResources | int | `0` | Ограничение на количество ресурсов, найденных в результате проверки. Используется для ограничения количества потребляемой памяти в больших средах |
| complianceOperator.benchmark.name | string | `"cis"` | При наличии нескольких версий бенчмарка, позволяет задать конкретную версию для проверки |
| complianceOperator.benchmark.version | string | `"1.10"` | При наличии нескольких версий бенчмарка, позволяет задать конкретную версию для проверки |
| complianceOperator.driver | string | `"gateway"` | Задает способ сохранения SBOM отчета в luntry. Допустимые значения: ["gateway", "db"] |
| complianceOperator.image.tag | string | `""` | Тэг образа |
| complianceOperator.image.name | string | `"compliance-operator"` | Имя образа |
| complianceOperator.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| complianceOperator.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| complianceOperator.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| complianceOperator.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| complianceOperator.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| complianceOperator.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| complianceOperator.resourcesPreset | string | `"none"` | Пресет ресурсов |
| complianceOperator.resources | object | `{"limits":{"cpu":"500m","memory":"500Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Запросы / лимиты ресурсов |
| complianceOperator.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| complianceOperator.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| complianceOperator.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |

### cmd-Dispatcher

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cmdDispatcher.enabled | bool | `true` | Включает деплой сервиса |
| cmdDispatcher.log.level | string | `"info"` | Уровень логирования |
| cmdDispatcher.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| cmdDispatcher.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| cmdDispatcher.tls.enabled | bool | `false` | Включает использование TLS между cmd-agent и cmd-dispatcher |
| cmdDispatcher.tls.crt.crtBase64 | string | `""` | Сертификат в Base64 |
| cmdDispatcher.tls.crt.keyBase64 | string | `""` | Ключ в Base64 |
| cmdDispatcher.tls.crt.secretName | string | `""` | Существующий секрет типа kubernetes.io/tls, содержащий сертификат и ключ |
| cmdDispatcher.tls.ca.crtBase64 | string | `""` | СА цепочка в Base64 формате |
| cmdDispatcher.tls.ca.secretName | string | `""` | Имя существующего секрета |
| cmdDispatcher.tls.ca.secretKey | string | `""` | Ключ содержащий сертификат |
| cmdDispatcher.image.tag | string | `""` | Тэг образа |
| cmdDispatcher.image.name | string | `"cmd-dispatcher"` | Имя образа |
| cmdDispatcher.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| cmdDispatcher.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| cmdDispatcher.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| cmdDispatcher.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| cmdDispatcher.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| cmdDispatcher.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| cmdDispatcher.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| cmdDispatcher.resourcesPreset | string | `"none"` | Пресет ресурсов |
| cmdDispatcher.resources | object | `{"limits":{"cpu":"500m","memory":"500Mi"},"requests":{"cpu":"200m","memory":"200Mi"}}` | Запросы / лимиты ресурсов |
| cmdDispatcher.securityContext | object | `{"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| cmdDispatcher.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| cmdDispatcher.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| cmdDispatcher.service.type | string | `"ClusterIP"` | Тип kubernetes сервиса |
| cmdDispatcher.service.nodePort | string | `""` | Порт на ноде кластера k8s, на который будет смаплен порт сервиса cmdDispatcher. Используется только в случае если service.type=NodePort |

### cmdAgent

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cmdAgent.enabled | bool | `true` | Включает деплой сервиса |
| cmdAgent.log.level | string | `"info"` | Уровень логирования |
| cmdAgent.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| cmdAgent.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| cmdAgent.image.tag | string | `""` | Тэг образа |
| cmdAgent.image.name | string | `"cmd-agent"` | Имя образа |
| cmdAgent.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| cmdAgent.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| cmdAgent.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| cmdAgent.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| cmdAgent.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| cmdAgent.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| cmdAgent.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| cmdAgent.resourcesPreset | string | `"none"` | Пресет ресурсов |
| cmdAgent.resources | object | `{"limits":{"cpu":"500m","memory":"500Mi"},"requests":{"cpu":"200m","memory":"200Mi"}}` | Запросы / лимиты ресурсов |
| cmdAgent.securityContext | object | `{"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| cmdAgent.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| cmdAgent.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |

### Data-provider

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dataProvider.enabled | bool | `true` | Включает деплой сервиса |
| dataProvider.log.user.enabled | bool | `false` | Логирование действий пользователей в Luntry |
| dataProvider.log.db.enabled | bool | `false` | Логирование запросов к БД |
| dataProvider.timeout.acquire | int | `60000` | Задает период ожидания ответа от data-provider в миллисекундах |
| dataProvider.node.maxOldSpaceSize | int | `1536` | Задает максимальный размер для node.js heap в мегабайтах |
| dataProvider.image.tag | string | `""` | Тэг образа |
| dataProvider.image.name | string | `"data-provider"` | Имя образа |
| dataProvider.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| dataProvider.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| dataProvider.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| dataProvider.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| dataProvider.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| dataProvider.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| dataProvider.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| dataProvider.resourcesPreset | string | `"none"` | Пресет ресурсов |
| dataProvider.resources | object | `{"limits":{"cpu":"1000m","memory":"2Gi"},"requests":{"cpu":"500m","memory":"500Mi"}}` | Запросы / лимиты ресурсов |
| dataProvider.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| dataProvider.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| dataProvider.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| dataProvider.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### DBwait

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dbwait.enabled | bool | `true` | Включает деплой сервиса |
| dbwait.image.tag | string | `""` | Тэг образа |
| dbwait.image.name | string | `"db-wait"` | Имя образа |
| dbwait.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| dbwait.resources | object | `{"limits":{"cpu":"100m","memory":"100Mi"},"requests":{"cpu":"10m","memory":"10Mi"}}` | Запросы / лимиты ресурсов |
| dbwait.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |

### Exporter

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| exporter.enabled | bool | `true` | Включает деплой сервиса |
| exporter.log.logLevel | string | `"info"` | Уровень логирования |
| exporter.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| exporter.tls.enabled | bool | `false` | Включает использование TLS между collector и exporter в мультикластерных инсталляциях |
| exporter.tls.crt.crtBase64 | string | `""` | Сертификат в Base64 |
| exporter.tls.crt.keyBase64 | string | `""` | Ключ в Base64 |
| exporter.tls.crt.secretName | string | `""` | Существующий секрет типа kubernetes.io/tls, содержащий сертификат и ключ |
| exporter.tls.ca.crtBase64 | string | `""` | СА цепочка в Base64 формате |
| exporter.tls.ca.secretName | string | `""` | Имя существующего секрета |
| exporter.tls.ca.secretKey | string | `""` | Ключ содержащий сертификат |
| exporter.export.mtls.enabled | bool | `false` | Включение взаимной TLS-аутентификации в модулях экспортера |
| exporter.export.mtls.mutualTlsFilesPath | string | `""` | Полный путь, где в контейнере хранятся сертификаты и ключ |
| exporter.export.mtls.certificate | string | `""` | Сертификат в Base64 |
| exporter.export.mtls.key | string | `""` | Ключ в Base64 |
| exporter.export.mtls.ca | string | `""` | СА цепочка в Base64 формате |
| exporter.export.targets | object | `{}` | Настройки для экспорта в системы, доступные варианты files/export-example.yaml |
| exporter.image.tag | string | `""` | Тэг образа |
| exporter.image.name | string | `"exporter"` | Имя образа |
| exporter.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| exporter.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| exporter.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| exporter.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| exporter.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| exporter.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| exporter.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| exporter.service.type | string | `"ClusterIP"` | Тип kubernetes сервиса |
| exporter.service.nodePortGrpc | string | `nil` | Порт на ноде кластера k8s, на который будет смаплен порт сервиса exporter. Используется только в случае если service.type=NodePort |
| exporter.service.nodePortMetrics | string | `nil` | Порт на ноде кластера k8s, на который будет смаплен служебный порт сервиса exporter, позволяющий получить метрики. Используется только в случае если service.type=NodePort |
| exporter.resourcesPreset | string | `"none"` | Пресет ресурсов |
| exporter.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"300m","memory":"200Mi"}}` | Запросы / лимиты ресурсов |
| exporter.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| exporter.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| exporter.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| exporter.probes.readiness.enabled | bool | `true` | Включает readiness пробу |
| exporter.probes.liveness.enabled | bool | `true` | Включает liveness пробу |
| exporter.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Gateway

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| gateway.enabled | bool | `true` | Включает деплой сервиса |
| gateway.log.logLevel | string | `"info"` | Уровень логирования |
| gateway.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| gateway.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| gateway.tls.enabled | bool | `false` | Включает использование TLS между gateway и watcher, networker, collector |
| gateway.tls.crt.crtBase64 | string | `""` | Сертификат в Base64 |
| gateway.tls.crt.keyBase64 | string | `""` | Ключ в Base64 |
| gateway.tls.crt.secretName | string | `""` | Существующий секрет типа kubernetes.io/tls, содержащий сертификат и ключ |
| gateway.tls.ca.crtBase64 | string | `""` | СА цепочка в Base64 формате |
| gateway.tls.ca.secretName | string | `""` | Имя существующего секрета |
| gateway.tls.ca.secretKey | string | `""` | Ключ содержащий сертификат |
| gateway.maxDbConnections | int | `8` | Максимальное количество одновременных соединений с БД |
| gateway.cache.enabled | bool | `true` | Включает кеширование в памяти |
| gateway.replicas | int | `1` | Количество реплик |
| gateway.image.tag | string | `""` | Тэг образа |
| gateway.image.name | string | `"gateway"` | Имя образа |
| gateway.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| gateway.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| gateway.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| gateway.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| gateway.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| gateway.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| gateway.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| gateway.service.type | string | `"ClusterIP"` | Тип kubernetes сервиса |
| gateway.service.port | int | `43100` | Порт сервиса gateway |
| gateway.service.nodePort | string | `nil` | Порт на ноде кластера k8s, на который будет смаплен порт сервиса gateway. Используется только в случае если service.type=NodePort |
| gateway.resourcesPreset | string | `"none"` | Пресет ресурсов |
| gateway.resources | object | `{"limits":{"cpu":"2000m","memory":"2Gi"},"requests":{"cpu":"300m","memory":"200Mi"}}` | Запросы / лимиты ресурсов |
| gateway.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| gateway.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| gateway.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| gateway.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Kafka

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kafka.enabled | bool | `true` | Включает деплой сервиса |
| kafka.kafkaHeapOpts | string | `"-XX:MaxRAMPercentage=70.0 -XX:InitialRAMPercentage=10.0"` | Задает максимальный и начальный размер heap для JVM. Рекомендуется устанавливать значение в 50-80% |
| kafka.initCleanupData | bool | `false` | Включает init контейнер, который удаляет все данные при рестарте kafka |
| kafka.image.registry | string | `""` | Путь к registry с образом |
| kafka.image.name | string | `"luntry/3dparty/kafka"` | Имя проекта и образа |
| kafka.image.tag | string | `"3.8.1"` | Тэг образа |
| kafka.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| kafka.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| kafka.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| kafka.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| kafka.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| kafka.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| kafka.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Container securityContext |
| kafka.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| kafka.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| kafka.podSecurityContext | object | `{"fsGroup":1000,"fsGroupChangePolicy":"Always"}` | Pod securityContext |
| kafka.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| kafka.resourcesPreset | string | `"none"` | Пресет ресурсов |
| kafka.resources | object | `{"limits":{"cpu":"2000m","memory":"3Gi"},"requests":{"cpu":"2000m","memory":"3Gi"}}` | Запросы / лимиты ресурсов |
| kafka.pvc.type | string | `"pvc"` | Тип хранилища |
| kafka.pvc.storageClass | string | `""` | Имя существующего StorageClass |
| kafka.pvc.size | string | `"10Gi"` | Размер хранилища |
| kafka.pvc.accessMode | string | `"ReadWriteOnce"` | Режимы доступа к хранилищу |
| kafka.pv.enabled | bool | `false` | Включает создание local storage PV при установке |
| kafka.pv.localPath | string | `"/opt/luntry-kafka"` | Путь на ноде для хранения данных PV (Путь должен быть предварительно создан на ноде) |
| kafka.pv.storageClass.create | bool | `true` | Создать local-only StorageClass при создании локального PV |
| kafka.pv.storageClass.name | string | `""` | Использовать существующий local-only StorageClass для локального PV |
| kafka.pv.reclaimPolicy | string | `"Recycle"` | Политика переиспользования PV, для сохранения данных в случае удаления, используйте "Retain" |
| kafka.metricExporter.enabled | bool | `false` | Включает деплой сервиса |
| kafka.metricExporter.image.registry | string | `"registry.hub.docker.com"` | Путь к registry с образом |
| kafka.metricExporter.image.name | string | `"redpandadata/kminion"` | Имя проекта и образа |
| kafka.metricExporter.image.tag | string | `"v2.2.13"` | Тэг образа |
| kafka.metricExporter.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| kafka.metricExporter.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"runAsGroup":101,"runAsUser":100}` | Container securityContext |
| kafka.metricExporter.resourcesPreset | string | `"none"` | Пресет ресурсов |
| kafka.metricExporter.resources | object | `{"limits":{"cpu":"200m","memory":"250Mi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |
| kafka.console.enabled | bool | `false` | Включает деплой kafka-console |
| kafka.console.image.registry | string | `"registry.hub.docker.com"` | Путь к registry с образом |
| kafka.console.image.name | string | `"redpandadata/console"` | Имя проекта и образа |
| kafka.console.image.tag | string | `"v2.7.2"` | Тэг образа |
| kafka.console.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| kafka.console.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"runAsGroup":101,"runAsUser":100}` | Container securityContext |
| kafka.console.resourcesPreset | string | `"none"` | Пресет ресурсов |
| kafka.console.resources | object | `{"limits":{"cpu":"1000m","memory":"1000Mi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |
| kafka.console.service.enabled | bool | `true` | Включает деплой сервиса kafka-console |
| kafka.console.service.type | string | `"ClusterIP"` | Тип kubernetes сервиса |
| kafka.console.service.nodePort | string | `nil` | Порт на ноде кластера k8s, на который будет смаплен порт сервиса Kafka. Используется только в случае если service.type=NodePort |
| kafka.pemToKeystore.resources | object | `{"limits":{"cpu":"150m","memory":"100Mi"},"requests":{"cpu":"100m","memory":"30Mi"}}` | Запросы / лимиты ресурсов |

### Linker

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| linker.enabled | bool | `true` | Включает деплой сервиса |
| linker.log.logLevel | string | `"info"` | Уровень логирования |
| linker.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| linker.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| linker.image.tag | string | `""` | Тэг образа |
| linker.image.name | string | `"networker"` | Имя образа |
| linker.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| linker.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| linker.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| linker.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| linker.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| linker.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| linker.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| linker.resourcesPreset | string | `"none"` | Пресет ресурсов |
| linker.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |
| linker.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| linker.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| linker.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| linker.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Migrator

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| migrator.debug | bool | `false` | Включает вывод отладочных логов в stdout |
| migrator.image.name | string | `"migrator"` | Имя образа |
| migrator.image.tag | string | `""` | Тэг образа |
| migrator.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| migrator.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"300Mi"}}` | Запросы / лимиты ресурсов |
| migrator.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| migrator.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| migrator.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| migrator.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |

### MigratorClickhouse

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| migratorClickhouse.enabled | bool | `true` | Включает деплой сервиса |
| migratorClickhouse.debug | bool | `false` | Включает вывод отладочных логов в stdout |
| migratorClickhouse.image.name | string | `"migrator-clickhouse"` | Имя образа |
| migratorClickhouse.image.tag | string | `""` | Тэг образа |
| migratorClickhouse.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| migratorClickhouse.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"300Mi"}}` | Запросы / лимиты ресурсов |
| migratorClickhouse.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| migratorClickhouse.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |

### Monitoring

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| monitoring.prometheusOperatorAnnotations.enabled | bool | `false` | Включает добавление к подам Luntry аннотаций для сбора prometheus метрик |
| monitoring.victoriaMetricsScrapeCR.enabled | bool | `false` | Включает деплой victoriaMetrics custom resources: VMPodScrape и VMServiceScrape для сбора prometheus метрик |
| monitoring.enabled | bool | `false` | Деплой локального prometheus и grafana (а также включение отдачи метрик во всех компонентах) |
| monitoring.grafana.enabled | bool | `true` | Включение установки пода grafana в неймспейс Luntry |
| monitoring.grafana.image.registry | string | `""` | Путь к registry с образом |
| monitoring.grafana.image.repository | string | `"luntry/3dparty/grafana"` | Имя проекта и образа |
| monitoring.grafana.image.tag | string | `"10.3.1"` | Тэг образа |
| monitoring.grafana.resourcesPreset | string | `"none"` | Пресет ресурсов |
| monitoring.grafana.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"250m","memory":"256Mi"}}` | Запросы / лимиты ресурсов |
| monitoring.grafana.service.type | string | `"LoadBalancer"` | Тип kubernetes сервиса |
| monitoring.grafana.ingress.enabled | bool | `false` | Включает использование ingress |
| monitoring.grafana.ingress.domainName | string | `""` | Доменное имя для доступа к веб-интерфейсу |
| monitoring.grafana.ingress.ingressClassName | string | `"nginx"` | ingress класс |
| monitoring.grafana.ingress.tls.enabled | bool | `false` | Включает использование TLS |
| monitoring.grafana.ingress.tls.secretName | string | `""` | Имя секрета в namespace Luntry, содержащего TLS-сертификат и ключ |
| monitoring.grafana.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| monitoring.grafana.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| monitoring.grafana.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| monitoring.grafana.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| monitoring.grafana.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| monitoring.grafana.securityContext | object | `{"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| monitoring.grafana.podSecurityContext | object | `{"fsGroup":65532,"fsGroupChangePolicy":"Always"}` | Pod securityContext |
| monitoring.grafana.pvc.type | string | `"pvc"` | Тип хранилища |
| monitoring.grafana.pvc.storageClass | string | `""` | Имя существующего StorageClass |
| monitoring.grafana.pvc.size | string | `"1Gi"` | Размер хранилища |
| monitoring.grafana.pvc.accessMode | string | `"ReadWriteOnce"` | Режимы доступа к хранилищу |
| monitoring.grafana.pv.enabled | bool | `false` | Включает создание local storage PV при установке |
| monitoring.grafana.pv.localPath | string | `"/opt/luntry-grafana"` | Путь на ноде для хранения данных PV (Путь должен быть предварительно создан на ноде) |
| monitoring.grafana.pv.storageClass.create | bool | `true` | Создать local-only StorageClass при создании локального PV |
| monitoring.grafana.pv.storageClass.name | string | `""` | Использовать существующий local-only StorageClass для локального PV |
| monitoring.grafana.pv.reclaimPolicy | string | `"Recycle"` | Политика переиспользования PV, для сохранения данных в случае удаления, используйте "Retain" |
| monitoring.prometheus.enabled | bool | `true` | Включение установки под prometheus в неймспейс Luntry |
| monitoring.prometheus.image.registry | string | `""` | Путь к registry с образом |
| monitoring.prometheus.image.repository | string | `"luntry/3dparty/prometheus"` | Имя проекта и образа |
| monitoring.prometheus.image.tag | string | `"v2.45.3"` | Тэг образа |
| monitoring.prometheus.resourcesPreset | string | `"none"` | Пресет ресурсов |
| monitoring.prometheus.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"250m","memory":"256Mi"}}` | Запросы / лимиты ресурсов |
| monitoring.prometheus.service.type | string | `"ClusterIP"` | Тип kubernetes сервиса |
| monitoring.prometheus.ingress.enabled | bool | `false` | Включает использование ingress |
| monitoring.prometheus.ingress.domainName | string | `""` | Доменное имя для доступа к веб-интерфейсу |
| monitoring.prometheus.ingress.ingressClassName | string | `"nginx"` | ingress класс |
| monitoring.prometheus.ingress.tls.enabled | bool | `false` | Включает использование TLS |
| monitoring.prometheus.ingress.tls.secretName | string | `""` | Имя секрета в namespace Luntry, содержащего TLS-сертификат и ключ |
| monitoring.prometheus.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| monitoring.prometheus.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| monitoring.prometheus.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| monitoring.prometheus.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| monitoring.prometheus.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| monitoring.prometheus.securityContext | object | `{"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| monitoring.prometheus.podSecurityContext | object | `{"fsGroup":65532,"fsGroupChangePolicy":"Always"}` | Pod securityContext |
| monitoring.prometheus.pvc.type | string | `"pvc"` | Тип хранилища |
| monitoring.prometheus.pvc.storageClass | string | `""` | Имя существующего StorageClass |
| monitoring.prometheus.pvc.size | string | `"10Gi"` | Размер хранилища |
| monitoring.prometheus.pvc.accessMode | string | `"ReadWriteOnce"` | Режимы доступа к хранилищу |
| monitoring.prometheus.pv.enabled | bool | `false` | Включает создание local storage PV при установке |
| monitoring.prometheus.pv.localPath | string | `"/opt/luntry-prometheus"` | Путь на ноде для хранения данных PV (Путь должен быть предварительно создан на ноде) |
| monitoring.prometheus.pv.storageClass.create | bool | `true` | Создать local-only StorageClass при создании локального PV |
| monitoring.prometheus.pv.storageClass.name | string | `""` | Использовать существующий local-only StorageClass для локального PV |
| monitoring.prometheus.pv.reclaimPolicy | string | `"Recycle"` | Политика переиспользования PV, для сохранения данных в случае удаления, используйте "Retain" |
| monitoring.prometheus.federation | list | `[]` | Лист значений для добавления federated prometheus серверов в мультикластер инсталляции |

### Networker

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| networker.enabled | bool | `true` | Включает деплой сервиса |
| networker.log.logLevel | string | `"info"` | Уровень логирования |
| networker.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| networker.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| networker.image.tag | string | `""` | Тэг образа |
| networker.image.name | string | `"networker"` | Имя образа |
| networker.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| networker.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| networker.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| networker.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| networker.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| networker.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| networker.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| networker.resourcesPreset | string | `"none"` | Пресет ресурсов |
| networker.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Запросы / лимиты ресурсов |
| networker.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| networker.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| networker.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| networker.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Policier

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| policier.enabled | bool | `true` | Включает деплой сервиса |
| policier.driver | string | `"gateway"` | Выбор драйвера для подключения к БД |
| policier.log.logLevel | string | `"info"` | Уровень логирования |
| policier.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| policier.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| policier.image.tag | string | `""` | Тэг образа |
| policier.image.name | string | `"policier"` | Имя образа |
| policier.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| policier.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| policier.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| policier.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| policier.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| policier.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| policier.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| policier.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| policier.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| policier.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| policier.resourcesPreset | string | `"none"` | Пресет ресурсов |
| policier.resources | object | `{"limits":{"cpu":"2000m","memory":"2Gi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |
| policier.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Retention

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| retention.enabled | bool | `true` | Включает деплой сервиса |
| retention.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| retention.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| retention.runSchedule | string | `"0 0 */1 * *"` | Периодичность запуска цикла отчистки в формате Cron "сек минут час день_мес день_нед" |
| retention.queryLimit | int | `1000` | Максимальное количество объектов удаляемых в рамках одного запроса |
| retention.defaultpolicy.anomaly | int | `24` | Период хранения информации об аномалиях (в часах) |
| retention.defaultpolicy.anomalyObservation | int | `24` | Период хранения информации о фактах регистрации аномалий (в часах) |
| retention.defaultpolicy.kubernetesHistory | int | `24` | Период хранения информации о k8s объектах (в часах) |
| retention.defaultpolicy.policies | int | `24` | Период хранения информации об изменениях k8s объектов (в часах) |
| retention.defaultpolicy.events | int | `24` | Период хранения информации о k8s событиях (в часах) |
| retention.defaultpolicy.ruleDetects | int | `24` | Период хранения информации о сработках Runtime Rules (в часах) |
| retention.image.tag | string | `""` | Тэг образа |
| retention.image.name | string | `"retention"` | Имя образа |
| retention.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| retention.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| retention.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| retention.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| retention.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| retention.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| retention.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| retention.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| retention.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| retention.resourcesPreset | string | `"none"` | Пресет ресурсов |
| retention.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |
| retention.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Redis

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| redis.enabled | bool | `true` | Включает деплой сервиса |
| redis.image.registry | string | `""` | Путь к registry с образом |
| redis.image.name | string | `"luntry/3dparty/redis"` | Имя проекта и образа |
| redis.image.tag | string | `"7.2.11"` | Тэг образа |
| redis.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| redis.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| redis.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| redis.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| redis.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| redis.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| redis.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"runAsGroup":1000,"runAsNonRoot":false,"runAsUser":1000}` | Container securityContext |
| redis.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| redis.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| redis.podSecurityContext | object | `{"fsGroup":1000,"fsGroupChangePolicy":"Always"}` | Pod securityContext |
| redis.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| redis.resourcesPreset | string | `"none"` | Пресет ресурсов |
| redis.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"1000m","memory":"1Gi"}}` | Запросы / лимиты ресурсов |
| redis.pvc.type | string | `"pvc"` | Тип хранилища |
| redis.pvc.storageClass | string | `""` | Имя существующего StorageClass |
| redis.pvc.size | string | `"10Gi"` | Размер хранилища |
| redis.pvc.accessMode | string | `"ReadWriteOnce"` | Режимы доступа к хранилищу |
| redis.pv.enabled | bool | `false` | Включает создание local storage PV при установке |
| redis.pv.localPath | string | `"/opt/luntry-redis"` | Путь на ноде для хранения данных PV (Путь должен быть предварительно создан на ноде) |
| redis.pv.storageClass.create | bool | `true` | Создать local-only StorageClass при создании локального PV |
| redis.pv.storageClass.name | string | `""` | Использовать существующий local-only StorageClass для локального PV |
| redis.pv.reclaimPolicy | string | `"Recycle"` | Политика переиспользования PV, для сохранения данных в случае удаления, используйте "Retain" |
| redis.metricExporter.enabled | bool | `false` | Включает деплой сервиса |
| redis.metricExporter.image.registry | string | `"registry.hub.docker.com"` | Путь к registry с образом |
| redis.metricExporter.image.name | string | `"oliver006/redis_exporter"` | Имя проекта и образа |
| redis.metricExporter.image.tag | string | `"v1.74.0"` | Тэг образа |
| redis.metricExporter.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| redis.metricExporter.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"runAsGroup":59000,"runAsUser":59000}` | Container securityContext |
| redis.metricExporter.resourcesPreset | string | `"none"` | Пресет ресурсов |
| redis.metricExporter.resources | object | `{"limits":{"cpu":"200m","memory":"250Mi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |

### Image Scanner

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| imageScanner.mode.cluster | bool | `true` | Включает деплой сервиса для сканирования образов в кластере |
| imageScanner.mode.registry | bool | `true` | Включает деплой сервиса для сканирования образов в реестрах |
| imageScanner.driver | string | `"gateway"` | Выбор драйвера для подключения к БД |
| imageScanner.log.logLevel | string | `"info"` | Уровень логирования |
| imageScanner.fallbackSecretNamespace | string | `""` | Имя неймспейса содержащего fallback секрет |
| imageScanner.scope | string | `"all-layers"` | Выбор скоупа сканирования |
| imageScanner.singleton | bool | `false` | Режим работы сканера. По умолчанию сканер работает в масштабируемом режиме |
| imageScanner.replicas.cluster | int | `1` | Количество реплик сканера для сканирования образов в кластере |
| imageScanner.replicas.registry | int | `1` | Количество реплик сканера для сканирования образов в реестрах |
| imageScanner.prometheus | object | `{"enabled":false}` | Метрики |
| imageScanner.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| imageScanner.profiling | object | `{"enabled":false}` | Профилирование |
| imageScanner.profiling.enabled | bool | `false` | Включает профилирование для сервиса |
| imageScanner.dbListing | string | `"https://v6.luntry.ru/latest.json"` | Адрес листинга БД уязвимостей |
| imageScanner.dbExploits | string | `"https://e.luntry.ru/e.tar.gz"` | Адрес БД эксплоитов |
| imageScanner.encryptionString | string | `""` | Строка для шифрования секретов при передаче |
| imageScanner.yara | object | `{"binaryPath":"yara-scanner","useBinary":true}` | Настройка использования YARA-сканера |
| imageScanner.yara.useBinary | bool | `true` | Использовать отдельный исполняемый файл для YARA сканирования |
| imageScanner.yara.binaryPath | string | `"yara-scanner"` | Относительный путь к исполняемому файлу с YARA сканером |
| imageScanner.image.tag | string | `""` | Тэг образа |
| imageScanner.image.name | string | `"image-scanner"` | Имя образа |
| imageScanner.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| imageScanner.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| imageScanner.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| imageScanner.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| imageScanner.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| imageScanner.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| imageScanner.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| imageScanner.resourcesPreset | string | `"none"` | Пресет ресурсов |
| imageScanner.resources | object | `{"limits":{"cpu":1,"memory":"2Gi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |
| imageScanner.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65532,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| imageScanner.podSecurityContext | object | `{"fsGroup":65532,"fsGroupChangePolicy":"Always"}` | Pod securityContext |
| imageScanner.rbac | object | `{"cluster":{"create":true},"registry":{"create":false}}` | RBAC |
| imageScanner.probes.readiness.enabled | bool | `true` | Включает readiness пробу |
| imageScanner.probes.liveness.enabled | bool | `true` | Включает liveness пробу |
| imageScanner.serviceAccount.cluster.create | bool | `true` | Включает создание сервис аккаунта для сканирования образов в кластере |
| imageScanner.serviceAccount.cluster.name | string | ReleaseName-image-scanner | Имя существующего сервис аккаунта для сканирования образов в кластере |
| imageScanner.serviceAccount.registry.create | bool | `false` | Включает создание сервис аккаунта для сканирования образов в реестрах |
| imageScanner.serviceAccount.registry.name | string | ReleaseName-registry-scanner | Имя существующего сервис аккаунта для сканирования образов в реестрах |
| imageScanner.pvc.type | string | `"emptydir"` | Тип хранилища |
| imageScanner.pvc.size | string | `"15Gi"` | Размер /tmp директории |
| imageScanner.pvc.storageClass | string | `""` | Имя существующего StorageClass |

### Sensor

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| sensor.enabled | bool | `true` | Включает деплой сервиса |
| sensor.btf.enabled | bool | `false` | Включает использование BTF информации для компиляции eBPF пробы. Используется в случае, если на нодах отсутствуют хедеры ядра |
| sensor.modulesDisabled.files | int | `0` | Отключает сбор файловых событий |
| sensor.modulesDisabled.network | int | `0` | Отключает сбор сетевых событий |
| sensor.unstableMonotonic.enabled | bool | `false` | В виртуализированных средах может возникать ошибка связанная с kernel monotonic clock |
| sensor.balancing.reconnectTimeout | int | `1800` | Задает время ожидания перед следующим реконнектом сенсора к коллектору при ребалансировке |
| sensor.balancing.reconnectPercDelta | int | `20` | Задает минимальную разницу нагрузки коллекторов при которой произойдет ребалансировка |
| sensor.dropOverflowEvents.enabled | bool | `false` | Включает отбрасывание избыточных событий, которые могут вызвать переполнение локальной RPC очереди, может приводить к потере событий |
| sensor.dropEventsBeforeConvergence.enabled | bool | `true` | Включает отбрасывание избыточных событий, на этапе запуска и построения дерева процессов. Позволяет снизить нагрузку на систему во время старта сенсора |
| sensor.sendNonContainerEvents.enabled | bool | `false` | Включает более агрессивный дроп событий не относящихся к контейнерным. Может приводить к потере контейнерных событий, имеет смысл использовать только в некоторых средах |
| sensor.rpcQueueCapacity | int | `600000` | Размер локальной очереди событий, рекомендуется увеличить значение в случае наблюдения проблем связанных с переполнением локальной очереди |
| sensor.argsLengthLimit | int | `1000` | Ограничивает размер аргументов процессов, передаваемых на бэкенд |
| sensor.log.logLevel | string | `"sensor=info"` | Уровень логирования. Установите "sensor=trace,procfs_scraper=trace,rpc=trace" для отладки. |
| sensor.log.bpfDebug | bool | `false` | Verbose режим загрузки eBPF-пробы |
| sensor.log.verbose | bool | `false` | Расширенный вывод в stdout |
| sensor.log.cleanup | bool | `false` | Запуск инит контейнера для очистки старых дебаг логов, имеет смысл включать только в случае если logLevel=trace |
| sensor.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| sensor.prometheus.address | string | `"0.0.0.0:8080"` | Настройка порта контейнера, на котором будут отображаться метрики |
| sensor.readinessCheck.enabled | bool | `true` | Включает readiness endpoint для подов сенсора. Сенсор переходит в Ready после окончания процедуры схождения |
| sensor.dataDir | string | `"/host/var/lib/sensor/"` | Задает директорию внутри сенсора для сохранения дебаг логов. Используется только в случае, если уровень логирования выставлен в trace |
| sensor.hostRoot | string | `"/host"` | Задает корневую директорию внутри контейнера для маунта директорий хоста |
| sensor.reactions.enabled | bool | `true` | Включает опции необходимые для применения reaction policies сенсором |
| sensor.reactions.remote.ftp.host | string | `""` | Адрес и порт ftp сервера |
| sensor.reactions.remote.ftp.username | string | `""` | Логин пользователя |
| sensor.reactions.remote.ftp.password | string | `""` | Пароль пользователя |
| sensor.reactions.remote.smb.host | string | `""` | Адрес и порт smb сервера |
| sensor.reactions.remote.smb.username | string | `""` | Логин пользователя |
| sensor.reactions.remote.smb.password | string | `""` | Пароль пользователя |
| sensor.reactions.remote.s3.host | string | `""` | Адрес и порт S3 сервера |
| sensor.reactions.remote.s3.username | string | `""` | Ключ доступа по S3 (access key) |
| sensor.reactions.remote.s3.password | string | `""` | Секретный ключ доступа по S3 (secret key) |
| sensor.reactions.remote.rsync.hostDir | string | `""` | Абсолютный путь к директории на хосте для сохранения дампов. Директория будет создана, если не существует |
| sensor.reactions.remote.rsync.containerDir | string | `""` | Абсолютный путь к директории внутри контейнера для сохранения дампа. Директория должна совпадать с указанной в поле Output Directory настроек Reaction Policy |
| sensor.image.name | string | `"sensor-rs"` | Имя образа |
| sensor.image.tag | string | `""` | Тэг образа |
| sensor.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| sensor.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| sensor.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| sensor.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| sensor.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| sensor.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| sensor.resourcesPreset | string | `"none"` | Пресет ресурсов |
| sensor.resources | object | `{"limits":{"cpu":"2000m","memory":"2Gi"},"requests":{"cpu":"200m","memory":"200Mi"}}` | Запросы / лимиты ресурсов |
| sensor.securityContext | object | `{"privileged":true,"runAsNonRoot":false}` | Container securityContext |
| sensor.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| sensor.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| sensor.pvc.type | string | `"emptydir"` | Тип хранилища |
| sensor.pvc.size | string | `"5Gi"` | Размер /tmp директории для сохранения дампа памяти и файловой системы перед отправкой на удаленный сервер |
| sensor.pvc.storageClass | string | `""` | Имя существующего StorageClass |

### Supervisor

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| supervisor.enabled | bool | `false` | Включает деплой сервиса |
| supervisor.debug | bool | `false` | Включает вывод отладочных логов в stdout |
| supervisor.defaultBranch | string | `"main"` | Deprecated |
| supervisor.image.name | string | `"supervisor"` | Имя образа |
| supervisor.image.tag | string | `""` | Тэг образа |
| supervisor.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| supervisor.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| supervisor.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| supervisor.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| supervisor.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| supervisor.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| supervisor.resourcesPreset | string | `"none"` | Пресет ресурсов |
| supervisor.resources | object | `{"limits":{"cpu":"1000m","memory":"2Gi"},"requests":{"cpu":"100m","memory":"300Mi"}}` | Запросы / лимиты ресурсов |
| supervisor.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| supervisor.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| supervisor.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| supervisor.pdb | object | `{"enabled":true,"minAvailable":1}` | PodDisruptionBudget |

### Visualizer

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| visualizer.enabled | bool | `true` | Включает деплой сервиса |
| visualizer.timeoutConfig.proxyTimeout | int | `300` | Задает максимальное время ожидания ответа клиентом |
| visualizer.image.tag | string | `""` | Тэг образа |
| visualizer.image.name | string | `"visualizer"` | Имя образа |
| visualizer.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| visualizer.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| visualizer.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| visualizer.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| visualizer.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| visualizer.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| visualizer.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| visualizer.resourcesPreset | string | `"none"` | Пресет ресурсов |
| visualizer.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"100Mi"}}` | Запросы / лимиты ресурсов |
| visualizer.service.type | string | `"LoadBalancer"` | Тип kubernetes сервиса |
| visualizer.service.nodePort | string | `nil` | Порт на ноде кластера k8s, на который будет смаплен порт сервиса visualizer. Используется только в случае если service.type=NodePort |
| visualizer.ingress.enabled | bool | `false` | Включает использование ingress |
| visualizer.ingress.domainName | string | `"visualizer.luntry"` | Доменное имя для доступа к веб-интерфейсу |
| visualizer.ingress.ingressClassName | string | `"nginx"` | ingress класс |
| visualizer.ingress.tls.enabled | bool | `false` | Включает использование TLS |
| visualizer.ingress.tls.secretName | string | `""` | Имя секрета в namespace Luntry, содержащего TLS-сертификат и ключ |
| visualizer.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| visualizer.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| visualizer.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| visualizer.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### VulnDB

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| vulndb.enabled | bool | `false` | Включает деплой сервиса |
| vulndb.address | string | `""` | Позволяет указать адрес сервиса vulndb, в случае если доступ к нему осуществляется снаружи кластера. Например через ingress. Адрес должен включать схему, например "https://vdb.corp.loc:8080" |
| vulndb.image.tag | string | `"v6-latest"` | Тэг образа |
| vulndb.image.name | string | `"vulndb"` | Имя образа |
| vulndb.image.pullPolicy | string | `"Always"` | imagePullPolicy |
| vulndb.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| vulndb.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| vulndb.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| vulndb.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| vulndb.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| vulndb.resourcesPreset | string | `"none"` | Пресет ресурсов |
| vulndb.resources | object | `{"limits":{"cpu":"100m","memory":"100Mi"},"requests":{"cpu":"50m","memory":"50Mi"}}` | Запросы / лимиты ресурсов |
| vulndb.service.type | string | `"ClusterIP"` | Тип kubernetes сервиса |
| vulndb.service.nodePort | string | `nil` | Порт на ноде кластера k8s, на который будет смаплен порт сервиса VulnDB. Используется только в случае если service.type=NodePort |
| vulndb.ingress.enabled | bool | `false` | Включает использование ingress |
| vulndb.ingress.domainName | string | `"vulndb.luntry"` | Доменное имя для доступа к VulnDB |
| vulndb.ingress.ingressClassName | string | `"nginx"` | ingress класс |
| vulndb.ingress.tls.enabled | bool | `false` | Включает использование TLS |
| vulndb.ingress.tls.secretName | string | `""` | Имя секрета в namespace Luntry, содержащего TLS-сертификат и ключ |
| vulndb.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| vulndb.serviceAccount.create | bool | `false` | Включает создание сервис аккаунта |
| vulndb.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |

### Watcher

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| watcher.enabled | bool | `true` | Включает деплой сервиса |
| watcher.log.logLevel | string | `"info"` | Уровень логирования |
| watcher.prometheus.enabled | bool | `false` | Включает отображение prometheus метрик для сервиса |
| watcher.profiling.enabled | bool | `false` | Включает профилирование сервиса |
| watcher.crdRescanInterval | int | `300` | Интервал обновления информации о k8s объектах в секундах. Уменьшение значения может привести к увеличению нагрузки на api-сервер |
| watcher.searchNamespace | string | `""` | Задает namespace для поиска конфигурации подписок на ресурсы |
| watcher.image.tag | string | `""` | Тэг образа |
| watcher.image.name | string | `"watcher"` | Имя образа |
| watcher.image.pullPolicy | string | `"IfNotPresent"` | imagePullPolicy |
| watcher.annotations | object | `{}` | Позволяет добавлять аннотации к подам |
| watcher.serviceAnnotations | object | `{}` | Позволяет добавлять аннотации к сервисам |
| watcher.nodeSelector | object | `{}` | Управляет назначением подов на ноды через механизм nodeSelector |
| watcher.tolerations | list | `[]` | Управляет назначением подов на ноды через механизм tolerations |
| watcher.affinity | object | `{}` | Управляет назначением подов на ноды через механизм affinity / anti-affinity |
| watcher.additionalEnvs | list | `[]` | Позволяет добавлять переменные окружения для компонентов |
| watcher.resourcesPreset | string | `"none"` | Пресет ресурсов |
| watcher.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"400Mi"}}` | Запросы / лимиты ресурсов |
| watcher.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsNonRoot":true,"runAsUser":65532}` | Container securityContext |
| watcher.serviceAccount.create | bool | `true` | Включает создание сервис аккаунта |
| watcher.serviceAccount.name | string | ReleaseName-servicename | Имя существующего сервис аккаунта |
| watcher.rbac | object | `{"allowPolicyEdit":{"kyverno":false,"network":false,"opa":false},"apiGroups":"[\"*\"]","create":true,"resources":"[\"*\"]","verbs":"[get, list, watch]"}` | RBAC |
| watcher.rbac.allowPolicyEdit.network | bool | `false` | Включение редактирования сетевых политик |
| watcher.rbac.allowPolicyEdit.opa | bool | `false` | Включение редактирования политик OPA Gatekeeper |
| watcher.rbac.allowPolicyEdit.kyverno | bool | `false` | Включение редактирования политик Kyverno |
| watcher.pdb | object | `{"enabled":false,"minAvailable":1}` | PodDisruptionBudget |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| allTag | string | `"v4.4.0"` | Глобальный тэг для образов, используется если не задан "service.image.tag" |
| globalResourcesPreset | string | `"none"` | Глобальный пресет ресурсов |
| licenseKey | string | `""` | Лицензия в формате Base64, также можно добавить позже в GUI |
| extraObjects | list | `[]` | Дополнительные манифесты для деплоя вместе с чартом |
