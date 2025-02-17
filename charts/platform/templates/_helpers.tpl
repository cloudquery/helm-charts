{{/*
Expand the name of the chart.
*/}}
{{- define "platform.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "platform.fullName" -}}
{{- if .Values.fullNameOverride }}
{{- .Values.fullNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "platform.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "platform.labels" -}}
helm.sh/chart: {{ include "platform.chart" . }}
{{ include "platform.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "platform.selectorLabels" -}}
app.kubernetes.io/name: {{ include "platform.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "platform.serviceAccount" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "platform.fullName" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return the image to use depending on the AppVersion and image tag defined
*/}}
{{- define "platform.image" -}}
{{ .Values.image.repository }}:{{ if .Values.image.tag }}{{ .Values.image.tag }}{{ else }}v{{ .Chart.AppVersion }}{{ end }}
{{- end }}

{{/*
Get the appropriate secret reference name based on whether external secrets is enabled
*/}}
{{- define "platform.secretRef" -}}
{{- if index .Values "externalSecrets" "enabled" -}}
{{- include "platform.fullName" . }}-external-secrets
{{- else -}}
{{- .Values.platformSecrets.secretRef -}}
{{- end -}}
{{- end -}}

{{/*
Get the appropriate secret reference name based on whether external secrets is enabled
*/}}
{{- define "platform.jwtPrivateKeyRef" -}}
{{- if index .Values "platformSecrets" "jwtPrivateKeyRef" -}}
{{- .Values.platformSecrets.jwtPrivateKeyRef -}}
{{- else -}}
{{- include "platform.fullName" . }}-jwt-private-key
{{- end -}}
{{- end -}}

{{/*
Init containers definition
*/}}
{{- define "platform.initContainers" -}}
- name: init-clickhouse
  image: cgr.dev/chainguard/wolfi-base:latest
  command:
    - /bin/sh
    - -c
  args:
    - |
      apk add --no-cache curl netcat-openbsd && \
      /scripts/init-clickhouse.sh
  volumeMounts:
    - name: init-scripts
      mountPath: /scripts
    - name: platform-secrets
      mountPath: /secrets
      readOnly: true
  securityContext:
    allowPrivilegeEscalation: false
    readOnlyRootFilesystem: false
    capabilities:
      drop:
        - ALL
{{- end -}}
