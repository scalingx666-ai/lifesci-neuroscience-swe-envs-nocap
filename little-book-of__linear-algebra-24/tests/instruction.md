# Issue

**Title:** Improve language navigation across home and localized books

## Description

### Motivation
- Make language switching more discoverable site-wide by consolidating scattered language links into a single, consistent navigation pattern.
- Provide in-content language jump links on the English homepage and on each localized book landing page so users can switch locales without using the top navbar.

### Description
- Replaced individual top-level language links in the root site navbar with a single `Languages` dropdown in `_quarto.yml` that points to `index.html` and each localized `*/index.html`.
- Applied the same `Languages` dropdown pattern to each localized configuration file at `books/*/_quarto.yml` so the navbar is consistent in every locale.
- Prepended a `Read in other languages` block to the main `index.qmd` and added a `## Languages` link block at the top of each `books/*/index.qmd` to provide an in-page language switcher.
- Files changed include `_quarto.yml`, `index.qmd`, and the localized files under `books/{de,es,ja,ko,vi,zh-CN}/` (both `_quarto.yml` and `index.qmd`).

### Testing
- Ran a repository-wide search using `rg` to confirm the new `Languages` menu and inserted language blocks were present, which succeeded.
- Attempted to run a full site render with `quarto --version && quarto render`, which failed in this environment because the `quarto` binary is not installed.
- Attempted to validate YAML with a small Python script using `yaml.safe_load`, which failed because the `PyYAML` module is not available in the environment.

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699bce7b386083208e0bffedecab2c29)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `614e307f6f95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.