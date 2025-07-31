# Development Workflow

## Chart Versioning and Release Process

### Important: Always Bump Chart Versions for Meaningful Changes

When making changes to Helm charts (templates, values, configuration, etc.), you **must** bump the chart version in `Chart.yaml` to trigger automatic releases. The chart-releaser-action only creates new releases when it detects chart version changes.

#### Version Bumping Guidelines

1. **Patch version bump** (e.g., 1.0.1 → 1.0.2): For bug fixes, security updates, or minor configuration changes
2. **Minor version bump** (e.g., 1.0.0 → 1.1.0): For new features, backwards-compatible changes
3. **Major version bump** (e.g., 1.0.0 → 2.0.0): For breaking changes

#### Example Scenarios

- **App version update**: If only updating `appVersion` (like updating datum from v0.3.1beta to v0.4.0beta), bump the patch version
- **Template changes**: Any changes to templates/ files require at least a patch version bump
- **Configuration changes**: Changes to values.yaml, especially defaults, require version bump
- **CI/Testing changes**: Changes only to ci/ test files may not require version bump unless they affect chart behavior

#### Process

1. Make your changes to chart files
2. Update the `version` field in `charts/<chart-name>/Chart.yaml`
3. Run `helm lint charts/<chart-name>` to verify
4. Commit and push your changes
5. The release workflow will automatically:
   - Detect version changes
   - Create GitHub releases
   - Package and publish charts

**Note**: The `ct.yaml` configuration disables version checking during PR validation to allow flexibility, but releases only happen when versions are actually bumped.

## Setting up pre-commit hooks

If you want to automatically generate `README.md` files with a pre-commit hook, make sure you
[install the pre-commit binary](https://pre-commit.com/#install), and add a [.pre-commit-config.yaml file](./.pre-commit-config.yaml)
to your project. Then run:

```bash
pre-commit install
pre-commit install-hooks
```

Future changes to your chart's `requirements.yaml`, `values.yaml`, `Chart.yaml`, or `README.md.gotmpl` files will cause an update to documentation when you commit.

There are several variants of `pre-commit` hooks to choose from depending on your use case.

#### `helm-docs`  Uses `helm-docs` binary located in your `PATH`

```yaml
---
repos:
  - repo: https://github.com/norwoodj/helm-docs
    rev:  ""
    hooks:
      - id: helm-docs
        args:
          # Make the tool search for charts only under the `charts` directory
          - --chart-search-root=charts

```


#### `helm-docs-built` Uses `helm-docs` built from code in git

```yaml
---
repos:
  - repo: https://github.com/norwoodj/helm-docs
    rev:  ""
    hooks:
      - id: helm-docs-built
        args:
          # Make the tool search for charts only under the `charts` directory
          - --chart-search-root=charts

```


#### `helm-docs-container` Uses the container image of `helm-docs:latest`

```yaml
---
repos:
  - repo: https://github.com/norwoodj/helm-docs
    rev:  ""
    hooks:
      - id: helm-docs-container
        args:
          # Make the tool search for charts only under the `charts` directory
          - --chart-search-root=charts

```

#### To pin the `helm-docs` container to a specific tag, follow the example below:


```yaml
---
repos:
  - repo: https://github.com/norwoodj/helm-docs
    rev:  ""
    hooks:
      - id: helm-docs-container
        entry: jnorwood/helm-docs:x.y.z
        args:
          # Make the tool search for charts only under the `charts` directory
          - --chart-search-root=charts

```
