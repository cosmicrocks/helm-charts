#!/bin/bash
# bump-chart-version.sh - Helper script to bump Helm chart versions

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHARTS_DIR="${SCRIPT_DIR}/../charts"

usage() {
    echo "Usage: $0 <chart-name> <major|minor|patch>"
    echo ""
    echo "Bump the version of a Helm chart and optionally the appVersion"
    echo ""
    echo "Arguments:"
    echo "  chart-name    Name of the chart (bitcoin, datum)"
    echo "  major|minor|patch   Type of version bump"
    echo ""
    echo "Examples:"
    echo "  $0 bitcoin patch    # 2.0.1 -> 2.0.2"
    echo "  $0 datum minor      # 1.0.2 -> 1.1.0"
    echo "  $0 bitcoin major    # 2.0.1 -> 3.0.0"
    exit 1
}

bump_version() {
    local version="$1"
    local bump_type="$2"
    
    local major minor patch
    IFS='.' read -r major minor patch <<< "$version"
    
    case "$bump_type" in
        major)
            echo "$((major + 1)).0.0"
            ;;
        minor)
            echo "${major}.$((minor + 1)).0"
            ;;
        patch)
            echo "${major}.${minor}.$((patch + 1))"
            ;;
        *)
            echo "Invalid bump type: $bump_type" >&2
            return 1
            ;;
    esac
}

main() {
    if [[ $# -ne 2 ]]; then
        usage
    fi
    
    local chart_name="$1"
    local bump_type="$2"
    local chart_dir="${CHARTS_DIR}/${chart_name}"
    local chart_yaml="${chart_dir}/Chart.yaml"
    
    if [[ ! -d "$chart_dir" ]]; then
        echo "Error: Chart directory not found: $chart_dir" >&2
        exit 1
    fi
    
    if [[ ! -f "$chart_yaml" ]]; then
        echo "Error: Chart.yaml not found: $chart_yaml" >&2
        exit 1
    fi
    
    # Extract current version
    local current_version
    current_version=$(grep '^version:' "$chart_yaml" | sed 's/version: //')
    
    if [[ -z "$current_version" ]]; then
        echo "Error: Could not extract current version from $chart_yaml" >&2
        exit 1
    fi
    
    # Calculate new version
    local new_version
    new_version=$(bump_version "$current_version" "$bump_type")
    
    echo "Bumping $chart_name chart version: $current_version -> $new_version"
    
    # Update Chart.yaml
    if command -v sed >/dev/null 2>&1; then
        # Use sed for in-place editing
        sed -i.bak "s/^version: .*/version: $new_version/" "$chart_yaml"
        rm -f "${chart_yaml}.bak"
    else
        echo "Error: sed command not found" >&2
        exit 1
    fi
    
    echo "Successfully updated $chart_yaml"
    echo ""
    echo "Next steps:"
    echo "1. Review the changes: git diff"
    echo "2. Test the chart: helm lint $chart_dir"
    echo "3. Commit and push: git add $chart_yaml && git commit -m 'bump: $chart_name chart version to $new_version'"
}

main "$@"