{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bitcoin.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bitcoin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bitcoin.labels" -}}
helm.sh/chart: {{ include "bitcoin.chart" . }}
{{ include "bitcoin.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bitcoin.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "bitcoin.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "bitcoin.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "rpcpassword" -}}

{{- $secret := (lookup "v1" "Secret" .Release.Namespace (printf "%s-rpcpassword" (include "bitcoin.fullname" .))) -}}
{{- if $secret -}}
{{/*
   Reusing current password since secret exists
*/}}
{{-  $secret.data.password | b64dec -}}
{{- else -}}
{{/*
    Generate new password
*/}}
{{- randAlpha 24 -}}
{{- end -}}
{{- end -}}

{{/* Define datum sidecar object */}}
{{- define "bitcoin.datumSidecar" -}}
{{- $fullName := include "bitcoin.fullname" . -}}
{{- $rpcPasswordSecretName := .Values.datum.bitcoin.secretName | default (printf "%s-rpcpassword" $fullName) -}}
name: datum
image: "{{ .Values.datum.image.repository }}:{{ .Values.datum.image.tag }}"
imagePullPolicy: {{ .Values.datum.image.pullPolicy | default "IfNotPresent" }}
{{- with .Values.datum.securityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
env:
  - name: BITCOIN_RPC_HOST
    value: {{ .Values.datum.bitcoin.rpcHost | default "localhost" | quote }}
  - name: BITCOIN_RPC_PORT
    value: {{ .Values.global.service.ports.rpc | quote }}
  - name: BITCOIN_RPC_USER
    value: {{ .Values.datum.bitcoin.rpcuser | quote }}
  - name: BITCOIN_RPC_PASSWORD
    valueFrom:
      secretKeyRef:
        name: {{ $rpcPasswordSecretName }}
        key: password
  - name: DATUM_MINING_ADDRESS
    value: {{ .Values.datum.mining.address | quote }}
  - name: DATUM_COINBASE_TAG_PRIMARY
    value: {{ .Values.datum.mining.coinbaseTagPrimary | quote }}
  - name: DATUM_COINBASE_TAG_SECONDARY
    value: {{ .Values.datum.mining.coinbaseTagSecondary | quote }}
  - name: DATUM_POOL_HOST
    value: {{ .Values.datum.mining.poolHost | quote }}
  # Add other necessary environment variables for datum from .Values.datum.env if needed
ports:
  - name: stratum
    containerPort: {{ .Values.datum.service.stratumPort }}
    protocol: TCP
  - name: datum-api
    containerPort: {{ .Values.datum.service.apiPort }}
    protocol: TCP
{{- with .Values.datum.resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
volumeMounts:
  # Example: Mount shared bitcoin config if datum needs it and if 'config' volume is defined for it
  # - name: config
  #   mountPath: /etc/bitcoin # Path inside datum container
  #   readOnly: true
  {{- if .Values.datum.persistence.enabled }}
  - name: datum-data
    mountPath: {{ .Values.datum.persistence.mountPath | default "/data/datum" }} # Ensure this path is unique if /data is shared
  {{- end }}
{{- end -}}
