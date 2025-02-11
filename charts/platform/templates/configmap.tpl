apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "platform.fullName" . }}-config
  labels:
    {{- include "platform.labels" . | nindent 4 }}
data:
  CQAPI_LOCAL_AES_KEY_FILE: "/data/storage/encrypted_aes_key.bin"
  CQAPI_LOCAL_COOKIE_SECURE: "false"
  CQAPI_MIRROR_ENABLED: "true"
  CQAPI_MIRROR_ALL_PLUGINS: "false"
  CQAPI_ASSETVIEW_INTERVAL: "1h"
  CQAPI_STORAGE_LOCAL_RELEASE_BASE_URL: "http://{{ include "platform.fullName" . }}.{{ .Release.Namespace }}:{{ .Values.service.targetPort }}/storage/files"
  CQAPI_STORAGE_LOCAL_UIASSET_BASE_URL: "/storage/files"
  {{- if .Values.scheduler.address }}
  CQAPI_MANAGEDSYNC_BACKEND_URL: "{{ .Values.scheduler.address }}"
  CQAPI_MANAGEDSYNC_PLATFORM_URL: "http://{{ include "platform.fullName" . }}.{{ .Release.Namespace }}:{{ .Values.service.targetPort }}/api"
  {{- end }}
---
{{- if .Values.otelCollector.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "platform.fullName" . }}-otel-collector-config
  labels:
    {{- include "platform.labels" . | nindent 4 }}
data:
  collector.yaml: |-
    {{ .Files.Get "config/otel-config.yaml" | nindent 4 }}
{{- end }}
---
{{- define "platform.clickhouse-init-script" -}}
#!/bin/bash
set -e

# Parse Clickhouse DSN
parse_clickhouse_dsn() {
    local dsn="$1"
    # Extract components from clickhouse://user:pass@host:port/db
    export CH_USER=$(echo "$dsn" | sed -n 's|clickhouse://\([^:]*\):.*|\1|p')
    export CH_PASS=$(echo "$dsn" | sed -n 's|clickhouse://[^:]*:\([^@]*\)@.*|\1|p')
    export CH_HOST=$(echo "$dsn" | sed -n 's|.*@\([^:]*\):.*|\1|p')
    export CH_PORT=$(echo "$dsn" | sed -n 's|.*:\([^/]*\)/.*|\1|p')
    export CH_DB=$(echo "$dsn" | sed -n 's|.*/\(.*\)|\1|p')
}

# Get Clickhouse DSN from secret
CLICKHOUSE_DSN=$(cat /secrets/clickhouseDSN)
parse_clickhouse_dsn "$CLICKHOUSE_DSN"

# Create database if it doesn't exist
check_db="SELECT name FROM system.databases WHERE name = '$CH_DB'"
create_db="CREATE DATABASE IF NOT EXISTS $CH_DB"

if ! echo "$check_db" | curl "https://$CH_HOST:8443/" --silent -u "$CH_USER:$CH_PASS" --data-binary @- | grep -q "$CH_DB"; then
    echo "Creating database $CH_DB..."
    echo "$create_db" | curl "https://$CH_HOST:8443/" --silent -u "$CH_USER:$CH_PASS" --data-binary @-
    echo "Database $CH_DB created successfully"
else
    echo "Database $CH_DB already exists"
fi
{{- end -}}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "platform.fullName" . }}-init-scripts
  namespace: {{ .Release.Namespace }}
data:
  init-clickhouse.sh: |-
{{ include "platform.clickhouse-init-script" . | indent 4 }}
