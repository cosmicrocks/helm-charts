# Datum

A Helm chart for Datum - a decentralized mining gateway for the OCEAN protocol.

## Description

Datum is a Bitcoin mining gateway that enables decentralized mining through the OCEAN protocol. It provides:

- Stratum mining protocol server
- Bitcoin RPC integration
- API for monitoring and management
- Configurable mining pools and solo mining support

## Prerequisites

- Kubernetes 1.20+
- Helm 3.0+
- Bitcoin node with RPC access

## Installing the Chart

```bash
helm install my-datum oci://ghcr.io/cosmicrocks/helm-charts/datum --version 1.0.0
```

## Configuration

The following table lists the configurable parameters of the Datum chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| api.adminPassword | string | `"admin"` |  |
| api.extraBlockSubmissionsUrls | string | `"[]"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| bitcoin.rpcHost | string | `"bitcoin:8332"` |  |
| bitcoin.rpcPasswordSecret.key | string | `"password"` |  |
| bitcoin.rpcPasswordSecret.name | string | `"bitcoin-rpcpassword"` |  |
| bitcoin.rpcUser | string | `"rpcuser"` |  |
| bitcoind.notifyFallback | bool | `true` |  |
| bitcoind.workUpdateSeconds | int | `40` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/cosmicrocks/datum"` |  |
| image.tag | string | `"v0.3.1beta"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.enabled | bool | `false` |  |
| livenessProbe.httpGet.path | string | `"/api/status"` |  |
| livenessProbe.httpGet.port | string | `"api"` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| logger.logCallingFunction | bool | `true` |  |
| logger.logFile | string | `""` |  |
| logger.logLevelConsole | int | `2` |  |
| logger.logLevelFile | int | `1` |  |
| logger.logRotateDaily | bool | `true` |  |
| logger.logToConsole | bool | `true` |  |
| logger.logToFile | bool | `false` |  |
| logger.logToStderr | bool | `false` |  |
| mining.address | string | `"bc1q676lj6ttgpu7p25uk3ex2thyxdrvralct2upl4"` |  |
| mining.coinbaseTagPrimary | string | `"DATUM Gateway"` |  |
| mining.coinbaseTagSecondary | string | `"Cosmic Rocks"` |  |
| mining.coinbaseUniqueId | int | `32359` |  |
| mining.poolHost | string | `"datum-beta1.mine.ocean.xyz"` |  |
| mining.saveSubmitblocksDir | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| pool.alwaysPaySelf | bool | `true` |  |
| pool.passFullUsers | bool | `true` |  |
| pool.passWorkers | bool | `true` |  |
| pool.pooledMiningOnly | bool | `false` |  |
| pool.port | int | `28915` |  |
| pool.protocolGlobalTimeout | int | `60` |  |
| pool.pubkey | string | `"f21f2f0ef0aa1970468f22bad9bb7f4535146f8e4a8f646bebc93da3d89b1406f40d032f09a417d94dc068055df654937922d2c89522e3e8f6f0e649de473003"` |  |
| readinessProbe.httpGet.path | string | `"/api/status"` |  |
| readinessProbe.httpGet.port | string | `"api"` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.ports.api | int | `8080` |  |
| service.ports.stratum | int | `23334` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| stratum.fingerprintMiners | bool | `true` |  |
| stratum.idleTimeoutMaxLastWork | int | `0` |  |
| stratum.idleTimeoutNoShares | int | `7200` |  |
| stratum.idleTimeoutNoSubscribe | int | `15` |  |
| stratum.maxClients | int | `1024` |  |
| stratum.maxClientsPerThread | int | `128` |  |
| stratum.maxThreads | int | `8` |  |
| stratum.shareStaleSeconds | int | `120` |  |
| stratum.vardiffMin | int | `16384` |  |
| stratum.vardiffQuickdiffCount | int | `8` |  |
| stratum.vardiffQuickdiffDelta | int | `8` |  |
| stratum.vardiffTargetSharesMin | int | `8` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

## Usage

### Basic Installation

Deploy Datum to connect to a Bitcoin node:

```bash
helm install datum cosmicrocks/datum \
  --set bitcoin.rpcHost="my-bitcoin-service:8332" \
  --set bitcoin.rpcPasswordSecret.name="my-bitcoin-secret"
```

### Mining Configuration

Configure mining settings:

```bash
helm install datum cosmicrocks/datum \
  --set mining.address="your-bitcoin-address" \
  --set mining.coinbaseTagPrimary="Your Pool Name" \
  --set mining.poolHost="your-pool.example.com"
```

### Solo Mining

For solo mining (no pool):

```bash
helm install datum cosmicrocks/datum \
  --set mining.poolHost=""
```

## Bitcoin Integration

Datum requires access to a Bitcoin node with RPC enabled. You can either:

1. Deploy the Bitcoin chart alongside Datum
2. Use an external Bitcoin node

The Bitcoin RPC credentials must be provided via a Kubernetes secret containing the RPC password.

## Monitoring

Datum exposes an API on port 8080 for monitoring:

```bash
kubectl port-forward svc/datum 8080:8080
curl http://localhost:8080/api/status
```

## Stratum Mining

Miners can connect to the Stratum server on port 23334:

```bash
# Point your miner to:
kubectl port-forward svc/datum 23334:23334
# Then configure your miner to connect to localhost:23334
```