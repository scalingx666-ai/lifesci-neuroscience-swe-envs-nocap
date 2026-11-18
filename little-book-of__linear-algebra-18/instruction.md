# Issue

**Title:** Add Chinese site scaffolding and translation tooling; Makefile multi‑language targets

## Description

### Motivation
- Provide automated tooling and Quarto project structure to offer a Chinese version of the book alongside the English site for GitHub Pages.
- Add a translation workflow (inspired by TAOCP scripts) to generate `books/zh-CN/` from the English sources and wire language switching into the site config.
- Make language build and translate actions scriptable via `Makefile` so renders and translations can be reproduced locally.
- Keep repository clean of binary artifacts and ensure translations are produced from text sources only.

### Description
- Added translation tooling under `scripts/`: `translate_book.py` (chunked translator preserving code/math), `translate_to_zh.py` wrapper, and `scripts/requirements.txt` for translator deps.
- Added a Chinese Quarto project at `books/zh-CN/` (`_quarto.yml`, `book.qmd`, `lab.qmd`, `index.qmd`) and updated the root `_quarto.yml` and `README.md` to expose the Chinese site link and nav item.
- Extended `Makefile` with `translate`, `render-zh`, and `render-all` targets and kept `preview/render` for the English site to support multi-language builds and a `translate` workflow.
- Implemented safe translation fallbacks and timeouts in the script and avoided committing any binary build artifacts; added generated Chinese content files to scaffold the site.

### Testing
- Installed Quarto CLI and verified the toolchain with `quarto --version` (succeeded).
- Installed translation dependencies via `python -m pip install -r scripts/requirements.txt` and executed the translation script to produce `books/zh-CN/index.qmd` and `books/zh-CN/book.qmd` (translation run completed and files were generated).
- Rendered the sites with `quarto render --to html --no-execute` and `quarto render books/zh-CN --no-execute` to verify HTML output for both English and Chinese projects (succeeded); a screenshot of the Chinese site rendering was produced.
- Noted `quarto render` with code execution initially failed due to a missing Jupyter kernel, then `ipykernel` was installed and renders with execution disabled were successful; full executed render requires local kernels and is therefore skipped in CI (warning recorded).

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699b4cde47cc8320ab66cdab37bcbd5e)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71866214207b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.