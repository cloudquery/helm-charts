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

# Terminal colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_header() {
  echo -e "\n${BLUE}=== $1 ===${NC}\n"
}

log_success() {
  echo -e "${GREEN}✓ $1${NC}"
}

log_error() {
  echo -e "${RED}✗ $1${NC}"
}

log_info() {
  echo -e "${YELLOW}➜ $1${NC}"
}

# Function to check database connectivity
check_db_connectivity() {
  local host=$1
  local port=$2
  local db_type=$3
  local max_attempts=5
  local attempt=1
  local wait_time=5

  log_info "Checking connectivity to $db_type at $host:$port..."
  
  while [ $attempt -le $max_attempts ]; do
    if nc -w 5 -zv $host $port 2>/dev/null; then
      log_success "$db_type connection successful"
      return 0
    fi
    
    if [ $attempt -lt $max_attempts ]; then
      log_info "Attempt $attempt of $max_attempts: Retrying in $wait_time seconds..."
      sleep $wait_time
    else
      log_error "Failed to connect to $db_type after $max_attempts attempts"
    fi
    attempt=$((attempt + 1))
  done

  return 1
}

# Parse Postgres DSN for connectivity check
parse_postgres_dsn() {
  local dsn=$1
  # Extract host and port from postgres://user:pass@host:port/dbname
  export PG_HOST=$(echo "$dsn" | sed -n 's|.*@\([^:]*\):.*|\1|p')
  export PG_PORT=$(echo "$dsn" | sed -n 's|.*:\([0-9]*\)/.*|\1|p')
}

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

# Start initialization
log_header "Starting CloudQuery Platform Initialization"

# Parse DSNs
log_header "Parsing Database Connection Strings"
POSTGRES_DSN=$(cat /secrets/postgresqlDSN)
CLICKHOUSE_DSN=$(cat /secrets/clickhouseDSN)

parse_postgres_dsn "$POSTGRES_DSN"
log_success "PostgreSQL connection string parsed"
parse_clickhouse_dsn "$CLICKHOUSE_DSN"
log_success "ClickHouse connection string parsed"

# Validate database connectivity
log_header "Validating Database Connectivity"

# Check PostgreSQL connectivity
if ! check_db_connectivity "$PG_HOST" "$PG_PORT" "PostgreSQL"; then
  log_error "PostgreSQL connectivity check failed"
  exit 1
fi

# Check ClickHouse connectivity
if ! check_db_connectivity "$CH_HOST" "$CH_PORT" "ClickHouse"; then
  log_error "ClickHouse connectivity check failed"
  exit 1
fi

# Initialize ClickHouse
log_header "Initializing ClickHouse Database"

# Determine ClickHouse protocol and port based on DSN
if [ "$CH_PORT" = "9440" ]; then
  PROTOCOL="https"
  HTTP_PORT="8443"
  CURL_OPTS="--silent --insecure"
  log_info "Using HTTPS protocol for ClickHouse"
else
  PROTOCOL="http"
  HTTP_PORT="8123"
  CURL_OPTS="--silent"
  log_info "Using HTTP protocol for ClickHouse"
fi

# Create ClickHouse database if it doesn't exist
log_info "Checking for database: $CH_DB"
check_db="SELECT name FROM system.databases WHERE name = '$CH_DB'"
create_db="CREATE DATABASE IF NOT EXISTS $CH_DB"

if ! echo "$check_db" | curl "$PROTOCOL://$CH_HOST:$HTTP_PORT/" $CURL_OPTS -u "$CH_USER:$CH_PASS" --data-binary @- | grep -q "$CH_DB"; then
  log_info "Database does not exist, creating..."
  if echo "$create_db" | curl "$PROTOCOL://$CH_HOST:$HTTP_PORT/" $CURL_OPTS -u "$CH_USER:$CH_PASS" --data-binary @-; then
    log_success "Database $CH_DB created successfully"
  else
    log_error "Failed to create database $CH_DB"
    exit 1
  fi
else
  log_success "Database $CH_DB already exists"
fi

# Final status
log_header "Initialization Complete"
echo -e "${GREEN}"
echo "✓ PostgreSQL connection validated"
echo "✓ ClickHouse connection validated"
echo "✓ ClickHouse database ready"
echo -e "${NC}"
echo "Platform initialization completed successfully!"

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
