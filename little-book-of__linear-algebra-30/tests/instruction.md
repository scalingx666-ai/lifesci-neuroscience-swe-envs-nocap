# Issue

**Title:** Fix Quarto navbar config for language switching

## Description

### Motivation
- The language switcher did not appear on the deployed site because Quarto expects top-level site navigation under `website.navbar` rather than `book.navbar` for website builds.
- GitHub Pages needs a correct base URL so language links resolve, so `website.site-url` should be set for the site.

### Description
- Moved the top navigation (language menu + GitHub icon) from `book.navbar` to `website.navbar` in the root `_quarto.yml` and added `website.site-url: https://little-book-of.github.io/linear-algebra/` for proper GitHub Pages base URL handling.
- Restored the English `book:` block (title/chapters/page-navigation) in `_quarto.yml` so book metadata and website navbar are separate.
- Updated all translated books (`books/de/_quarto.yml`, `books/es/_quarto.yml`, `books/ja/_quarto.yml`, `books/ko/_quarto.yml`, `books/vi/_quarto.yml`, `books/zh-CN/_quarto.yml`) to include a `website.navbar` section with the same language menu and GitHub link.
- Changes applied to 7 files in total to align navbar behavior across locales.

### Testing
- Ran `quarto render --to html` locally but it failed because the Quarto CLI is not installed in this environment (`command not found: quarto`).
- Verified repository changes with `git status` and `git diff` which succeeded and confirmed the `_quarto.yml` and translated `_quarto.yml` updates.
- The repository's GitHub Actions workflow installs Quarto and will validate rendering during CI/CD deploys to GitHub Pages.

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699c15c174608320a5310d12086dddc1)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53e66e82f11b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.