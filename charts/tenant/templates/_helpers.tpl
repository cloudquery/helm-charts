{{/*
Expand the name of the chart.
*/}}
{{- define "tenant-init.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tenant-init.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tenant-init.labels" -}}
helm.sh/chart: {{ include "tenant-init.chart" . }}
{{ include "tenant-init.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tenant-init.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tenant-init.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }} 