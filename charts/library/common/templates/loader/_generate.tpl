{{/*
Secondary entrypoint and primary loader for the common chart
*/}}
{{- define "ntrp.common.loader.generate" -}}
  {{- /* Enable code-server add-on if required */ -}}
  {{- if .Values.addons.codeserver.enabled -}}
    {{- include "ntrp.common.addon.codeserver" . | nindent 0 -}}
  {{- end -}}

  {{- /* Enable VPN add-on if required */ -}}
  {{- if .Values.addons.vpn.enabled -}}
    {{- include "ntrp.common.addon.vpn" . | nindent 0 -}}
  {{- end -}}

  {{- /* Enable promtail add-on if required */ -}}
  {{- if .Values.addons.promtail.enabled -}}
    {{- include "ntrp.common.addon.promtail" . | nindent 0 -}}
  {{- end -}}

  {{- /* Enable netshoot add-on if required */ -}}
  {{- if .Values.addons.netshoot.enabled -}}
    {{- include "ntrp.common.addon.netshoot" . | nindent 0 -}}
  {{- end -}}

  {{- /* Build the templates */ -}}
  {{- include "ntrp.common.render.configmaps" . | nindent 0 -}}
  {{- include "ntrp.common.render.secrets" . | nindent 0 -}}
  {{- include "ntrp.common.render.pvcs" . | nindent 0 -}}
  {{- include "ntrp.common.render.serviceAccount" . | nindent 0 -}}
  {{- include "ntrp.common.render.controller" . | nindent 0 -}}
  {{- include "ntrp.common.render.services" . | nindent 0 -}}
  {{- include "ntrp.common.render.ingresses" . | nindent 0 -}}
  {{- include "ntrp.common.render.serviceMonitors" . | nindent 0 -}}
{{- end -}}
