{{/* Selector labels shared across objects */}}
{{- define "ntrp.common.lib.metadata.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ntrp.common.lib.chart.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
