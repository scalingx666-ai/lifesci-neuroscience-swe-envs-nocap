# Issue

**Title:** fix(lint): stage trust-ledger enforcement behind strict_trust

## Description

.

Upgrading past `2026.7.4` made `obsidian-wiki lint` fail-closed on every legacy
page and on a missing trust ledger, skipping the staged migration from #28
(warn first, enforce for new pages, full enforcement only after a backfill
tool ships).

## Summary
- Split `base_confidence`/`lifecycle` out of the core required-frontmatter
  check into a new `confidence_missing_fields` finding.
- Added `strict_trust: bool = False` to `lint_vault()`. Default mode: missing
  trust fields, ledger errors, stale reviews, and score mismatches warn.
  `strict_trust=True` restores fail-closed enforcement.
- Added `--strict-trust` CLI flag and `OBSIDIAN_TRUST_STRICT=1` config switch
  for `obsidian-wiki lint`. Ledger presence alone no longer silently enables
  strict mode; the owner opts in explicitly.

## Test plan
- [x] `python3 -m pytest -q` — 245 passed
- [x] Updated three `tests/test_trust.py` cases that had encoded the old
      fail-closed behavior as expected
- [x] Added `tests/test_lint.py` coverage for legacy-mode warn, strict-mode
      fail, the CLI flag, and a clean fully-reviewed vault passing under
      strict mode
- [x] Manually reproduced the issue's minimal legacy-page example against the
      CLI before and after the fix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `035dad519906`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.