# bitcoin

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: knots20250305](https://img.shields.io/badge/AppVersion-knots20250305-informational?style=flat-square)

A Helm chart for Bitcoin knots with datum for decentralized mining by the OCEAN protocol.

**Homepage:** <https://github.com/cosmicrocks/helm-charts/tree/main/charts/bitcoin>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| esomore | <itamar@cosmic.rocks> |  |

## Source Code

* <https://github.com/cosmicrocks/helm-charts/tree/main/charts/bitcoin>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| bitcoin.acceptNonStdDataCarrier | int | `0` |  |
| bitcoin.acceptNonStdTxn | int | `0` |  |
| bitcoin.blockMaxSize | int | `3985000` |  |
| bitcoin.blockMaxWeight | int | `3985000` |  |
| bitcoin.blockMinTxFee | float | `0.00001` |  |
| bitcoin.blockPrioritySize | int | `0` |  |
| bitcoin.blockReconstructionExtraTxn | int | `10000` |  |
| bitcoin.bytesPerSigop | int | `20` |  |
| bitcoin.bytesPerSigopStrict | int | `20` |  |
| bitcoin.dataCarrierCost | int | `1` |  |
| bitcoin.dataCarrierSize | int | `1` |  |
| bitcoin.dataCarrierSizeLimit | int | `42` |  |
| bitcoin.datumHost | string | `"127.0.0.1"` |  |
| bitcoin.datumPort | int | `8080` |  |
| bitcoin.dbCache | int | `4096` |  |
| bitcoin.dbCrashRatio | float | `0.0001` |  |
| bitcoin.maxConnections | int | `80` |  |
| bitcoin.maxMempool | int | `600` |  |
| bitcoin.maxScriptSize | int | `1650` |  |
| bitcoin.mempoolFullRbf | int | `1` |  |
| bitcoin.mempoolReplacement | string | `"fee,-optin"` |  |
| bitcoin.minRelayTxFee | float | `0.00001` |  |
| bitcoin.permitBareMultisig | int | `0` |  |
| bitcoin.permitBarePubkey | int | `0` |  |
| bitcoin.printtoconsoleEnabled | int | `1` |  |
| bitcoin.reindex | int | `0` |  |
| bitcoin.reindexChainstate | int | `0` |  |
| bitcoin.rejectParasites | int | `1` |  |
| bitcoin.rpcAllowIP | string | `"0.0.0.0/0"` |  |
| bitcoin.rpcBind | string | `"0.0.0.0"` |  |
| bitcoin.rpcUser | string | `"rpcuser"` |  |
| bitcoin.rpcWorkQueue | int | `1000` |  |
| bitcoin.serverEnabled | int | `1` |  |
| bitcoin.spkReuse | string | `"allow"` |  |
| bitcoin.txindexEnabled | int | `1` |  |
| bitcoin.zmqPubHashBlock | string | `"tcp://0.0.0.0:8433"` |  |
| bitcoin.zmqPubRawBlock | string | `"tcp://0.0.0.0:8432"` |  |
| bitcoin.zmqPubRawTx | string | `"tcp://0.0.0.0:8431"` |  |
| command | list | `[]` |  |
| datum.api.adminPassword | string | `"admin"` |  |
| datum.api.extraBlockSubmissionsUrls | string | `"[]"` |  |
| datum.bitcoin.rpcHost | string | `"localhost:8332"` |  |
| datum.bitcoin.rpcuser | string | `"rpcuser"` |  |
| datum.bitcoind.notifyFallback | bool | `true` |  |
| datum.bitcoind.workUpdateSeconds | int | `40` |  |
| datum.enabled | bool | `true` |  |
| datum.image.pullPolicy | string | `"Always"` |  |
| datum.image.repository | string | `"ghcr.io/cosmicrocks/datum"` |  |
| datum.image.tag | string | `"v0.3.1beta"` |  |
| datum.logger.logCallingFunction | bool | `true` |  |
| datum.logger.logFile | string | `""` |  |
| datum.logger.logLevelConsole | int | `2` |  |
| datum.logger.logLevelFile | int | `1` |  |
| datum.logger.logRotateDaily | bool | `true` |  |
| datum.logger.logToConsole | bool | `true` |  |
| datum.logger.logToFile | bool | `false` |  |
| datum.logger.logToStderr | bool | `false` |  |
| datum.mining.address | string | `"bc1q676lj6ttgpu7p25uk3ex2thyxdrvralct2upl4"` |  |
| datum.mining.coinbaseTagPrimary | string | `"DATUM Gateway"` |  |
| datum.mining.coinbaseTagSecondary | string | `"Cosmic Rocks"` |  |
| datum.mining.coinbaseUniqueId | int | `32359` |  |
| datum.mining.poolHost | string | `"datum-beta1.mine.ocean.xyz"` |  |
| datum.mining.saveSubmitblocksDir | string | `""` |  |
| datum.podSecurityContext.fsGroup | int | `1000` |  |
| datum.pool.alwaysPaySelf | bool | `true` |  |
| datum.pool.passFullUsers | bool | `true` |  |
| datum.pool.passWorkers | bool | `true` |  |
| datum.pool.pooledMiningOnly | bool | `false` |  |
| datum.pool.port | int | `28915` |  |
| datum.pool.protocolGlobalTimeout | int | `60` |  |
| datum.pool.pubkey | string | `"f21f2f0ef0aa1970468f22bad9bb7f4535146f8e4a8f646bebc93da3d89b1406f40d032f09a417d94dc068055df654937922d2c89522e3e8f6f0e649de473003"` |  |
| datum.resources.limits.memory | string | `"512Mi"` |  |
| datum.resources.requests.cpu | string | `"100m"` |  |
| datum.resources.requests.memory | string | `"512Mi"` |  |
| datum.service.apiPort | int | `8080` |  |
| datum.service.stratumPort | int | `23334` |  |
| datum.stratum.fingerprintMiners | bool | `true` |  |
| datum.stratum.idleTimeoutMaxLastWork | int | `0` |  |
| datum.stratum.idleTimeoutNoShares | int | `7200` |  |
| datum.stratum.idleTimeoutNoSubscribe | int | `15` |  |
| datum.stratum.maxClients | int | `1024` |  |
| datum.stratum.maxClientsPerThread | int | `128` |  |
| datum.stratum.maxThreads | int | `8` |  |
| datum.stratum.shareStaleSeconds | int | `120` |  |
| datum.stratum.vardiffMin | int | `16384` |  |
| datum.stratum.vardiffQuickdiffCount | int | `8` |  |
| datum.stratum.vardiffQuickdiffDelta | int | `8` |  |
| datum.stratum.vardiffTargetSharesMin | int | `8` |  |
| extraInitContainers | list | `[]` |  |
| fullnameOverride | string | `"bitcoin"` |  |
| global.network | string | `"mainnet"` |  |
| global.service.ports.rpc | int | `8332` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/cosmicrocks/knots"` |  |
| image.tag | string | `"28.1.knots20250305"` |  |
| imagePullSecrets | list | `[]` |  |
| labels | object | `{}` |  |
| metrics.podMonitor.enabled | bool | `false` |  |
| metrics.podMonitor.interval | string | `"30s"` |  |
| metrics.podMonitor.scrapeTimeout | string | `"20s"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.size | string | `"900Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels.app | string | `"bitcoin"` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| priorityClassName | string | `""` |  |
| replicaCount | int | `1` |  |
| resources | string | `nil` |  |
| secrets.create | bool | `true` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.ports.datum | int | `8080` |  |
| service.ports.metrics | int | `9223` |  |
| service.ports.p2p | int | `8333` |  |
| service.ports.stratum | int | `23334` |  |
| service.ports.zmqpubhashblock | int | `8433` |  |
| service.ports.zmqpubrawblock | int | `8432` |  |
| service.ports.zmqpubrawtx | int | `8431` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sidecarContainers | list | `[]` |  |
| terminationGracePeriodSeconds | int | `10` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
