{{/*
Renders the serviceAccount object required by the chart.
*/}}
{{- define "ntrp.common.render.serviceAccount" -}}
  {{- if .Values.serviceAccount.create -}}
    {{- include "ntrp.common.class.serviceAccount" $ | nindent 0 -}}
  {{- end -}}
{{- end -}}
