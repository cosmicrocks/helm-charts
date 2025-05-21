# Cosmic Rocks Helm Charts
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/cosmicrocks)](https://artifacthub.io/packages/search?repo=cosmicrocks)

This repository contains Helm charts for deploying applications on Kubernetes.

## Charts

- [`bitcoin`](charts/bitcoin/README.md): Helm chart for deploying a Bitcoin node.
- [`datum`](charts/datumn/README.md): Helm chart for deploying a Datumn node.

## Usage

1. Add this repository to your Helm repositories (if published):
   ```sh
   helm repo add cosmic-rocks <repo-url>
   helm repo update
   ```
2. Install a chart:
   ```sh
   helm install my-bitcoin cosmic-rocks/bitcoin
   ```
   Or, from local source:
   ```sh
   helm install my-bitcoin ./charts/bitcoin
   ```

## Development

- Chart documentation is generated using [`helm-docs`](https://github.com/norwoodj/helm-docs):
  ```sh
  helm-docs --chart-search-root=charts
  ```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the terms of the [MIT License](LICENSE).
