{{/*
The volume (referencing config) to be inserted into additionalVolumes.
*/}}
{{- define "ntrp.common.addon.promtail.volumeSpec" -}}
configMap:
  name: {{ include "ntrp.common.lib.chart.names.fullname" . }}-addon-promtail
{{- end -}}
