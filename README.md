# Homebrew Tap

[![Audit](https://github.com/clouatre-labs/homebrew-tap/actions/workflows/audit.yml/badge.svg)](https://github.com/clouatre-labs/homebrew-tap/actions/workflows/audit.yml)
[![REUSE status](https://api.reuse.software/badge/github.com/clouatre-labs/homebrew-tap)](https://api.reuse.software/info/github.com/clouatre-labs/homebrew-tap)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)

Homebrew tap for [clouatre-labs](https://github.com/clouatre-labs) projects.

## Installation

```bash
brew tap clouatre-labs/tap
```

## Available Formulas

| Formula | Description |
|---------|-------------|
| [aptu](https://github.com/clouatre-labs/aptu) | Gamified OSS issue triage with AI assistance |
| [aptu-coder](https://github.com/clouatre-labs/aptu-coder) | MCP server for code structure analysis using tree-sitter |

> [!NOTE]
> The `aptu-mcp` formula has been removed and is no longer maintained. Its
> functionality lives on in the `aptu` CLI; use `brew install clouatre-labs/tap/aptu`
> instead.

## Architecture

```mermaid
flowchart LR
    subgraph gh[GitHub Releases]
        A[aptu artifacts]
        C[aptu-coder artifacts]
    end
    subgraph tap[clouatre-labs/tap]
        F1[Formula/aptu.rb]
        F2[Formula/aptu-coder.rb]
    end
    subgraph homebrew[Homebrew]
        B[brew audit / brew style]
        U[brew install / brew upgrade]
    end
    A -->|url + sha256 per platform| F1
    C -->|url + sha256 per platform| F2
    F1 --> B
    F2 --> B
    B -->|pass| U
    U --> User[(macOS / Linux user)]
```

*Figure 1: Each formula pins a release tarball and SHA-256 per platform from the
upstream GitHub release. Formulas are validated with `brew audit`/`brew style`
and consumed via `brew install clouatre-labs/tap/<formula>`.*

## Usage

Install a formula:

```bash
brew install clouatre-labs/tap/aptu
```

Or after tapping:

```bash
brew install aptu
```

## Updating

```bash
brew update
brew upgrade aptu
```

## Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Run `brew audit --strict --online Formula/<formula>.rb`
5. Run `brew style Formula/<formula>.rb`
6. Submit a pull request

## License

Each formula specifies its own license. See individual formula files for details.
Repository metadata is licensed [Apache-2.0](LICENSE) — see [REUSE.toml](REUSE.toml).
