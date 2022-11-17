{{/*
Template to render code-server addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "ntrp.common.addon.codeserver" -}}
  {{- if .Values.addons.codeserver.enabled -}}
    {{/* Append the code-server container to the additionalContainers */}}
    {{- $container := include "ntrp.common.addon.codeserver.container" . | fromYaml -}}
    {{- if $container -}}
      {{- $_ := set .Values.additionalContainers "addon-codeserver" $container -}}
    {{- end -}}

    {{/* Include the deployKeySecret if not empty */}}
    {{- if or .Values.addons.codeserver.git.deployKey .Values.addons.codeserver.git.deployKeyBase64 -}}
      {{- $deployKeySecret := include "ntrp.common.addon.codeserver.deployKeySecret" . -}}
      {{- if $deployKeySecret -}}
        {{- $_ := set .Values.secrets "addon-codeserver-deploykey" (dict "enabled" "true" "stringData" ($deployKeySecret | fromYaml)) -}}
      {{- end -}}
    {{- end -}}

    {{/* Append the secret volume to the volumes */}}
    {{- if or .Values.addons.codeserver.git.deployKey .Values.addons.codeserver.git.deployKeyBase64 .Values.addons.codeserver.git.deployKeySecret }}
      {{- $volume := include "ntrp.common.addon.codeserver.deployKeyVolumeSpec" . | fromYaml -}}
      {{- if $volume -}}
        {{- $_ := set .Values.persistence "deploykey" (dict "enabled" "true" "mountPath" "-" "type" "custom" "volumeSpec" $volume) -}}
      {{- end -}}
    {{- end -}}

    {{/* Add the code-server service */}}
    {{- $_ := set .Values.service "addon-codeserver" .Values.addons.codeserver.service -}}

    {{/* Add the code-server ingress */}}
    {{- $svcName := printf "%v-addon-codeserver" (include "ntrp.common.lib.chart.names.fullname" .) -}}
    {{- $svcPort := .Values.addons.codeserver.service.ports.codeserver.port -}}
    {{- range $_, $host := .Values.addons.codeserver.ingress.hosts -}}
      {{- $_ := set (index $host.paths 0) "service" (dict "name" $svcName "port" $svcPort) -}}
    {{- end -}}
    {{- $_ := set .Values.ingress "addon-codeserver" .Values.addons.codeserver.ingress -}}
  {{- end -}}
{{- end -}}
