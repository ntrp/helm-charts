{{/*
The VPN config and scripts to be included.
*/}}
{{- define "ntrp.common.addon.vpn.configmap" -}}
{{- with .Values.addons.vpn.scripts.up }}
up.sh: |-
  {{- . | nindent 2}}
{{- end }}

{{- with .Values.addons.vpn.scripts.down }}
down.sh: |-
  {{- . | nindent 2}}
{{- end -}}
{{- end -}}
