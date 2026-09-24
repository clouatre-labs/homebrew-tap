# AGENTS.md

Guidance for AI coding agents working in this repository.

## What this repo is

A Homebrew tap: one Ruby formula per clouatre-labs project under `Formula/`.
Each formula pins a release tarball URL and SHA-256 per platform
(macOS ARM, Linux ARM, Linux x86_64) from the upstream GitHub release.

## Rules

- **Do not modify formula logic unless asked.** Formulas are intentionally
  minimal (`url`/`sha256` blocks, `install`, `test`). Most changes are
  version bumps only: update every platform's `url` and `sha256` together,
  never partially.
- **SHA-256 values must be real.** Never invent a hash — download the
  artifact or use the upstream release's checksums. A wrong sha256 breaks
  `brew install` for every user.
- **Keep formulas in style.** Run `brew style Formula/<name>.rb` and, when
  online artifacts are available, `brew audit --strict --online
  Formula/<name>.rb` before committing.
- **Update README in the same change** when adding or removing a formula
  (Available Formulas table).
- **REUSE compliance:** all files carry `Apache-2.0` via `REUSE.toml`; new
  files are covered by the existing annotations — no per-file headers needed.
- **CI:** the `audit` workflow runs zizmor (GitHub Actions security scanning)
  and formula checks on every PR. Do not add unpinned third-party actions;
  use commit-SHA pins like existing workflows.
- **No breaking changes.** Formula names and install paths are user-facing
  API. Removing a formula is a deprecation decision, not a cleanup.
