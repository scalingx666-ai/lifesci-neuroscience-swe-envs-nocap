# Issue

**Title:** fix(lint): exclude redirect stubs from duplicate title and stem findings

## Description

## Problem

`wiki-dedup` merges a duplicate page into a canonical page and leaves a redirect stub at the secondary path. The stub intentionally keeps its original title and filename so old links remain usable, with `redirects_to: "[[<canonical page>]]"` in its frontmatter. But `obsidian-wiki lint` builds its duplicate-title and duplicate-stem candidate sets from all pages, stubs included, so every successful merge keeps producing duplicate warnings for the pair it just created.

Reproduction (the issue's vault): `concepts/example.md` titled `Example`, plus `entities/example.md` titled `Example` with `redirects_to: "[[concepts/example]]"`. `lint_vault()` reports the pair in both `duplicate_titles` and `duplicate_stems`.

## Change

`obsidian_wiki/lint.py`:

- `_parse_page()` now surfaces the parsed `redirects_to` frontmatter value.
- Pages carrying `redirects_to:` are excluded from the `duplicate_titles` and `duplicate_stems` candidate sets — the same distinction the `wiki-dedup` registry already makes.
- The pointers are validated in a new `redirect_issues` finding, following the existing `superseded_dangling` pattern: a stub whose target does not resolve (`missing_target`), points at itself (`self_reference`), or points at another stub (`redirect_chain`) is reported. This is the validation `.skills/wiki-dedup/SKILL.md` already specifies for wiki-lint. `redirect_issues` is warn-level, like `superseded_dangling`.
- `docs/cli.md` documents the stub handling next to the duplicate checks.

Other checks (broken links, frontmatter, orphans, …) treat stubs exactly as before; this change is only about the duplicate candidate sets plus the new pointer validation.

## Tests

Four new tests in `tests/test_lint.py`:

- a valid redirect stub triggers no duplicate findings and no `redirect_issues`;
- a stub whose target is missing is reported as `missing_target`, and still stays out of the duplicate checks;
- a stub pointing at another stub is reported as `redirect_chain`;
- two real pages sharing a title/stem are still reported as duplicates (guard).

On the pre-fix code the first three fail and the guard passes; with the fix the whole `tests/test_lint.py` passes (61 tests). Full suite: 1,238 passed / 12 failed with the fix vs 1,234 passed / 12 failed on the pre-change baseline — the 12 failures are identical, test for test, on both sides (pre-existing environment failures in the sync/portable-keys tests, unrelated to lint), and the +4 are the new tests above.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2605405ce6e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.