{{/* Common labels shared across objects */}}
{{- define "ntrp.common.lib.metadata.allLabels" -}}
helm.sh/chart: {{ include "ntrp.common.lib.chart.names.chart" . }}
{{ include "ntrp.common.lib.metadata.selectorLabels" . }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "ntrp.common.lib.metadata.globalLabels" . }}
{{- end -}}
