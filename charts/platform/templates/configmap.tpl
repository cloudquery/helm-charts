apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "platform.fullName" . }}-config
  labels:
    {{- include "platform.labels" . | nindent 4 }}
data:
  CQAPI_LOCAL_COOKIE_SECURE: "false"
  CQAPI_MIRROR_ENABLED: "true"
  CQAPI_MIRROR_ALL_PLUGINS: "true"
  CQAPI_ASSETVIEW_INTERVAL: "1m"
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
    export CH_PORT=$(echo "$dsn" | sed -n 's|.*:\([^/?]*\)/.*|\1|p')
    export CH_DB=$(echo "$dsn" | sed -n 's|.*/\([^?]*\).*|\1|p')
}

# Get Clickhouse DSN from secret
CLICKHOUSE_DSN=$(cat /secrets/clickhouseDSN)
parse_clickhouse_dsn "$CLICKHOUSE_DSN"

# Determine protocol and port based on DSN
if [ "$CH_PORT" = "9440" ]; then
    PROTOCOL="https"
    HTTP_PORT="8443"
    CURL_OPTS="--silent --insecure"
else
    PROTOCOL="http"
    HTTP_PORT="8123"
    CURL_OPTS="--silent"
fi

# Function to execute ClickHouse query
execute_query() {
    local query="$1"
    local result
    result=$(curl "$PROTOCOL://$CH_HOST:$HTTP_PORT/" \
        $CURL_OPTS \
        -u "$CH_USER:$CH_PASS" \
        --data-binary "$query")
    echo "$result"
    return $?
}

# Check if database exists
echo "Checking if database exists..."
DB_EXISTS=$(execute_query "SELECT name FROM system.databases WHERE name = '$CH_DB'")
if [ $? -ne 0 ]; then
    echo "Failed to query database list"
    exit 1
fi

if [ -z "$DB_EXISTS" ]; then
    echo "Creating database $CH_DB..."
    if ! execute_query "CREATE DATABASE IF NOT EXISTS $CH_DB"; then
        echo "Failed to create database $CH_DB"
        exit 1
    fi
    echo "Database $CH_DB created successfully"
else
    echo "Database $CH_DB already exists"
fi

exit 0
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
