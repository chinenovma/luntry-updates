#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="sec-admin-clusterrole.yaml"
SEC_ADMIN_GROUP="${1:-sec-admin}"  # Передать имя AD группы для RoleBinding

echo "Генерация ClusterRole для группы: $SEC_ADMIN_GROUP"

# ==========================================
# 1. Сбор всех API групп и ресурсов исключая secrets
# ==========================================
# Получаем список всех ресурсов в формате: группированное_имя.версия/название_ресурса
# Исключаем secrets, а также служебные/опасные ресурсы, если нужно.

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Получаем все apiGroups, в которых есть ресурсы
kubectl api-resources --verbs=list --namespaced -o wide | awk 'NR>1 {print $3}' | sort -u > "$TMP_DIR/apigroups.txt"

# Формируем ClusterRole 
cat > "$OUTPUT_FILE" <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: sec-admin
  labels:
    purpose: audit
    role: security-administrator
rules:
EOF

# ==========================================
# 2. Генерация правил для каждой API группы
# ==========================================
# Читаем API группы
while IFS= read -r apigroup; do
    # Пропускаем пустые строки
    [[ -z "$apigroup" ]] && continue
    
    # Получаем список ресурсов для этой группы
    # Исключаем secrets на уровне API-группы core ("" или core)
    if [[ "$apigroup" == "" || "$apigroup" == "core" ]]; then
        # Для core API группы исключаем secrets
        resources=$(kubectl api-resources --verbs=list --namespaced -o name | grep -v "secrets" | tr '\n' ',' | sed 's/,$//')
        apigroup_yaml='""'
    else
        # Для остальных групп берем все ресурсы
        # (в некоторых группах могут быть свои секреты, но чаще всего они в core)
        resources=$(kubectl api-resources --verbs=list --namespaced -o wide | awk -v group="$apigroup" '$3==group {print $1}' | tr '\n' ',' | sed 's/,$//')
        apigroup_yaml="\"$apigroup\""
    fi
    
    # Если ресурсов нет, пропускаем
    [[ -z "$resources" ]] && continue
    
    # Форматируем YAML-список ресурсов
    echo "  # API Group: $apigroup" >> "$OUTPUT_FILE"
    echo "  - apiGroups: [$apigroup_yaml]" >> "$OUTPUT_FILE"
    echo "    resources:" >> "$OUTPUT_FILE"
    
    # Разбиваем ресурсы по запятой и добавляем префикс
    IFS=',' read -ra RES_ARRAY <<< "$resources"
    for res in "${RES_ARRAY[@]}"; do
        echo "      - $res" >> "$OUTPUT_FILE"
    done
    
    echo "    verbs: [\"get\", \"list\", \"watch\"]" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    
done < "$TMP_DIR/apigroups.txt"

# ==========================================
# 3. Добавление ClusterRoleBinding
# ==========================================
cat >> "$OUTPUT_FILE" <<EOF
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: sec-admin-binding
subjects:
  - kind: Group
    name: "$SEC_ADMIN_GROUP"
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: sec-admin
  apiGroup: rbac.authorization.k8s.io
EOF

echo "Готово! Файл $OUTPUT_FILE сгенерирован."
echo "Требуется проверить права перед применением: kubectl apply -f $OUTPUT_FILE"
