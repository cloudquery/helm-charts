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
  CQAPI_CLUSTER_NAME: "{{ .Values.clickhouse.clusterName }}"
  CQAPI_STORAGE_LOCAL_RELEASE_BASE_URL: "http://{{ include "platform.fullName" . }}.{{ .Release.Namespace }}:{{ .Values.service.targetPort }}/storage/files"
  CQAPI_STORAGE_LOCAL_UIASSET_BASE_URL: "/storage/files"
  {{- if .Values.scheduler.address }}
  CQAPI_MANAGEDSYNC_BACKEND_URL: "{{ .Values.scheduler.address }}"
  CQAPI_MANAGEDSYNC_PLATFORM_URL: "http://{{ include "platform.fullName" . }}.{{ .Release.Namespace }}:{{ .Values.service.targetPort }}/api"
  {{- end }}
  {{- if .Values.otelCollector.enabled }}
  CQAPI_MANAGEDSYNC_OTEL_COLLECTOR_URL: "opentelemetry-collector.{{ .Release.Namespace }}.svc.cluster.local:4318"
  {{- end }}
  {{- if .Values.s3Source.enabled }}
  CQAPI_ENABLE_S3_SOURCE: "true"
  CQAPI_S3_SOURCE_IAM_ROLE: {{ .Values.s3Source.iamRole }}
  CQAPI_S3_SOURCE_QUEUE_NAME: {{ .Values.s3Source.queueName }}
  CQAPI_S3_SOURCE_QUEUE_ACCOUNT_ID: {{ .Values.s3Source.queueAccountId }}
  CQAPI_S3_SOURCE_BUCKET_NAME: {{ .Values.s3Source.bucketName }}
  CQAPI_S3_SOURCE_BUCKET_REGION: {{ .Values.s3Source.bucketRegion }}
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
