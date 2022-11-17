{{- define "ntrp.common.loader.init" -}}
  {{- /* Merge the local chart values and the common chart defaults */ -}}
  {{- include "ntrp.common.values.init" . }}
{{- end -}}
