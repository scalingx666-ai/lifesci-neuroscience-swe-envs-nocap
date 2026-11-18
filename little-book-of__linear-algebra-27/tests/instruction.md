# Issue

**Title:** Translate Chinese book and lab content and restore page-break markers

## Description

### Motivation
- Complete the missing Chinese translation for the main book and lab so the `zh-CN` edition is usable and consistent with the English source.
- Preserve executable code, math blocks and structural markers while fixing broken/escaped page-break tokens for proper Quarto/LaTeX rendering.

### Description
- Translated prose from `books/en-US/book.qmd` and `books/en-US/lab.qmd` into `books/zh-CN/book.qmd` and `books/zh-CN/lab.qmd` using the repository translation toolchain (`scripts/translate_book.py`) while leaving code and math blocks intact.
- Restored escaped page-break sequences so Quarto/Latex page breaks use the correct `\newpage` token instead of a translated/escaped variant.
- Kept translation tooling and checkpoint behavior: translations are produced via the chunked translator and protected inline spans are preserved.
- Updated the generated `books/zh-CN/*` files with the translated content and page-break fixes so the localized site content is available.

### Testing
- Ran the translator `scripts/translate_book.py --source-lang en --target-lang zh-CN --files books/en-US/book.qmd books/en-US/lab.qmd` to produce the `books/zh-CN` outputs and exercised chunked translation across the large files.
- Verified translation coverage with the repository verifier (`scripts.translate_book.verify_translation`): reported untranslated paragraph counts (book: `51/3231`, lab: `341/2116`) indicating the bulk of prose was translated and highlighting remaining short/untranslated blocks.
- Checked structural fixes with quick searches such as `rg -n -F '\newpage' books/zh-CN/book.qmd` to confirm page-break tokens were restored and inspected head/tail snippets of `books/zh-CN/book.qmd` and `books/zh-CN/lab.qmd` to validate code blocks and math were preserved.
- All automated translation and verification commands completed successfully and the updated `books/zh-CN/book.qmd` and `books/zh-CN/lab.qmd` files contain the translated content and fixed markup.

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699bea26ca8c8320aa38ddbc1c5fb20f)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d3f88762c3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.