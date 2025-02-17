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
