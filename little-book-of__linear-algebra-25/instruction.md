# Issue

**Title:** Fix Quarto navbar config and add GitHub Pages build/deploy workflow

## Description

### Motivation
- The book header/navbar controls were not rendering because navbar settings were placed under `website` instead of the `book` section in Quarto book configs.
- A GitHub Actions workflow was needed to build the Quarto HTML outputs (English + translations) and publish `docs/` to GitHub Pages so configuration changes are rendered and published automatically.

### Description
- Moved `page-navigation` and `navbar` settings into the `book` section for the root and all translated books and removed the misplaced `website.title` entries.
- Added a `quarto-publish.yml` workflow at `.github/workflows/quarto-publish.yml` that sets up Quarto, renders the English site and each translated book to HTML, uploads the `docs/` artifact, and deploys pages on pushes to `master`.
- Updated files: `_quarto.yml`, `books/de/_quarto.yml`, `books/es/_quarto.yml`, `books/ja/_quarto.yml`, `books/ko/_quarto.yml`, `books/vi/_quarto.yml`, `books/zh-CN/_quarto.yml`, and added `.github/workflows/quarto-publish.yml`.

### Testing
- Ran a YAML load for all updated Quarto config files and workflows using `python3` with `pyyaml`, and the files parsed successfully.
- Installed `pyyaml` via `python3 -m pip install --user pyyaml` as part of the validation and that installation completed successfully.
- Attempted `quarto --version && quarto render --to html` locally but it failed because the Quarto CLI is not installed in this environment (render step could not be executed here).

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699bd0602a088320aff653eeab2005b6)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `399061211360`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.