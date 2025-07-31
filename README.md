# Cosmic Rocks Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This repository contains Helm charts for the OCEAN protocol Bitcoin infrastructure components.

## Available Charts

### Bitcoin
A Helm chart for Bitcoin Knots, providing a production-ready Bitcoin node deployment with:
- StatefulSet deployment for stable persistent storage
- Configurable service types (ClusterIP, NodePort, LoadBalancer)
- Prometheus monitoring support
- Flexible networking configurations (mainnet, testnet, regtest)

### Datum
A Helm chart for Datum - a decentralized mining gateway for the OCEAN protocol with:
- Stratum mining server
- Management API
- Integration with Bitcoin RPC
- Health checks and monitoring

## Usage

### Adding the Repository

```bash
helm repo add cosmicrocks https://cosmicrocks.github.io/helm-charts/
helm repo update
```

### Installing Charts

```bash
# Install Bitcoin node
helm install bitcoin cosmicrocks/bitcoin

# Install Datum mining gateway
helm install datum cosmicrocks/datum
```

### Configuration

Each chart includes comprehensive configuration options. See individual chart README files for details:
- [Bitcoin Chart](./charts/bitcoin/README.md)
- [Datum Chart](./charts/datum/README.md)

## Development

### Contributing

Please read [CONTRIBUTING.md](./CONTRIBUTING.md) for development guidelines.

**Important**: When making changes to charts, always bump the chart version in `Chart.yaml` to trigger automatic releases.

### Chart Versioning

This repository uses automated releases through chart-releaser-action. New releases are only created when chart versions are incremented:

- **Patch versions** (x.y.z → x.y.z+1): Bug fixes, configuration updates
- **Minor versions** (x.y.z → x.y+1.0): New features, backwards-compatible changes  
- **Major versions** (x.y.z → x+1.0.0): Breaking changes

### Local Development

```bash
# Lint charts
helm lint charts/bitcoin charts/datum

# Test templating
helm template bitcoin charts/bitcoin
helm template datum charts/datum

# Test installation (requires Kubernetes cluster)
helm install bitcoin-test charts/bitcoin --dry-run
```

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](./LICENSE) for details.