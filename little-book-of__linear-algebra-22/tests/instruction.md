# Issue

**Title:** Add Spanish site, translations, and multilingual navigation; build targets for ES

## Description

### Motivation

- Provide a Spanish translation of the book and integrate it into the Quarto multi-language site so readers can switch between languages from the navbar.
- Make the build and translation workflows support the new `es` project alongside existing languages and add a helper script to generate Spanish content.
- Ensure each localized site’s navbar exposes links to all available languages so readers can navigate between language sites.

### Description

- Add a Spanish book project under `books/es/` including `books/es/_quarto.yml`, translated `books/es/book.qmd`, `books/es/index.qmd`, and `books/es/lab.qmd`.
- Update root and per-language Quarto configs to surface `Español` in the site navbar by changing `_quarto.yml` and `books/{zh-CN,vi,ja,ko}/_quarto.yml`.
- Extend build automation in `Makefile`: introduce `ES_PROJECT`, `render-es`, and `translate-es` targets and include Spanish in `render-all` and `translate-*` flows.
- Add `scripts/translate_to_es.py` that invokes the existing `scripts/translate_book.py` to produce Spanish files; re-used the existing translation pipeline and safeguards for code/math blocks.
- Small developer ergonomics: add the Spanish GitHub Pages link to `README.md`.

### Testing

- Installed translation dependencies with `python3 -m pip install -r scripts/requirements.txt` (succeeded).
- Ran the translation pipeline to produce Spanish content with `python3 scripts/translate_book.py --target-lang es` and targeted-file invocations such as `--files books/en-US/book.qmd books/en-US/lab.qmd` (translation runs completed and `books/es/` now contains `book.qmd`, `lab.qmd`, and `index.qmd`).
- Verified generated Spanish pages at `books/es/` and updated `_quarto.yml`/`Makefile` entries are present and consistent.
- Attempted to validate site rendering with `quarto render books/es` but could not complete because the `quarto` binary is not available in the execution environment (render step failed due to missing `quarto`).

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699ba194535c832089be519be7c55217)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95649c3ddd04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.