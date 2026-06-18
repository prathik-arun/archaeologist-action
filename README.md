# ☠ Archaeologist GitHub Action

Automated codebase intelligence reports — posted as GitHub Issues on a schedule you choose.

**Five tools, one action:**
- ☠ Dead code finder (git history + static analysis)
- ◈ Complexity scorer
- ⧉ Duplicate detector
- ◎ Change impact analyzer
- ⬡ Architecture graph (run locally)

## Quick Start

Create `.github/workflows/archaeologist.yml` in your repo:

```yaml
name: Archaeologist Codebase Report

on:
  schedule:
    - cron: '0 9 * * 1'   # Every Monday at 9am UTC
  workflow_dispatch:        # Run manually anytime

jobs:
  analyze:
    runs-on: ubuntu-latest
    permissions:
      issues: write
      contents: read
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0    # Full git history for better accuracy

      - uses: prathik-arun/archaeologist-action@v1
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          min-confidence: 70
          min-complexity: 15
```

That's it. Every Monday morning a GitHub Issue appears with your full codebase report.

## Run Daily

```yaml
on:
  schedule:
    - cron: '0 9 * * *'   # Every day at 9am UTC
```

## Inputs

| Input | Default | Description |
|-------|---------|-------------|
| `min-confidence` | `70` | Minimum dead code confidence (0-100) |
| `min-complexity` | `15` | Minimum complexity score to report |
| `language` | `` | Filter by language (python, dart, typescript, go...) |
| `github-token` | auto | GitHub token for posting issues |

## What the Report Looks Like

Each run creates a GitHub Issue titled `☠ Archaeologist Codebase Report — YYYY-MM-DD` containing:

- **Dead code** — functions with no callers, ranked by confidence score
- **Complexity** — most complex functions, ranked worst-first
- **Duplicates** — copy-paste code and near-identical functions
- **Impact** — files ranked by blast radius (how much breaks if you change them)

## Languages Supported

Python · JavaScript · TypeScript · Dart/Flutter · Go · Java · Kotlin · Ruby · Rust · Swift

## Install Locally Too

```bash
pip3 install archaeologist
archaeologist-graph ./my-project          # Interactive architecture graph
archaeologist-impact ./my-project --all   # Full impact report
archaeologist-complexity ./my-project --html
archaeologist-dupes ./my-project --html
deadcode ./my-project --explain
```

Website: https://prathik-arun.github.io/archaeologist
