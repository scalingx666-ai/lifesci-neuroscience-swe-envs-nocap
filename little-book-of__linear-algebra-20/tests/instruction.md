# Issue

**Title:** Add Japanese site scaffolding, translation tooling, and CI targets for Quarto/GitHub Pages

## Description

### Motivation
- Prepare the book for a Japanese site by adding a Japanese Quarto subproject and wiring it into the site navigation and build automation so the site can publish a /ja/ site alongside /en-US/, /zh-CN/, and /vi/.
- Reuse the existing translation pipeline to generate Japanese content programmatically and provide Makefile targets and a small helper script to run the translation and render steps consistently.

### Description
- Add a new Japanese Quarto project under `books/ja/` including `index.qmd`, `book.qmd`, and `lab.qmd` (Japanese translations of the book content) and a `books/ja/_quarto.yml` project config so Quarto can output `docs/ja` for GitHub Pages.
- Add `scripts/translate_to_ja.py` to invoke the existing `scripts/translate_book.py` translation pipeline with `--target-lang ja`.
- Update root site configuration in `_quarto.yml` to include a Japanese navbar link and add Japanese links to the Vietnamese and Chinese subproject `_quarto.yml` files so language navbars cross-link.
- Update `Makefile` to declare `JA_PROJECT = books/ja`, add `render-ja` and `translate-ja` targets and include `render-ja` in `render-all`, and add `translate-ja` alongside other translate targets.
- Update `README.md` to expose the Japanese GitHub Pages URL.
- Populate `books/ja/` with the translated files produced by the translation script so the Japanese site has complete chapter files (generated via the pipeline).

### Testing
- Ran dependency install `python3 -m pip install -r scripts/requirements.txt` successfully to prepare translation tooling. (succeeded)
- Executed the book translation pipeline to generate Japanese content (`scripts/translate_book.py --target-lang ja` and targeted runs), which produced `books/ja/index.qmd`, `books/ja/book.qmd`, and `books/ja/lab.qmd` without fallback chunks; files were inspected and present. (succeeded)
- Ran `make help` to verify new Makefile targets (`render-ja`, `translate-ja`, and updated `render-all`) appear in help output. (succeeded)
- Attempted `quarto render books/ja` to perform a full local render of the Japanese site, but the environment lacks the `quarto` CLI so rendering could not be executed here. (`quarto` not installed)

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699b5d38ff548320a0c88d8d88359d03)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ac31fd3a6fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.