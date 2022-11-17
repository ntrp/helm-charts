{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "ntrp.common.loader.all" -}}
  {{- /* Generate chart and dependency values */ -}}
  {{- include "ntrp.common.loader.init" . -}}

  {{- /* Generate remaining objects */ -}}
  {{- include "ntrp.common.loader.generate" . -}}
{{- end -}}
