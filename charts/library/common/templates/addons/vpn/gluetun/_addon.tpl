{{/*
Template to render gluetun addon. It will add the container to the list of additionalContainers.
*/}}
*/}}
{{- define "ntrp.common.addon.gluetun" -}}
  {{/* Append the gluetun container to the additionalContainers */}}
  {{- $container := fromYaml (include "ntrp.common.addon.gluetun.container" .) -}}
  {{- if $container -}}
    {{- $_ := set .Values.additionalContainers "addon-gluetun" $container -}}
  {{- end -}}
{{- end -}}
