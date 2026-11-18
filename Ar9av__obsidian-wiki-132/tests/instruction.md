# Issue

**Title:** fix(lint): add approved confidence trust ledger

## Description

## Summary

- replace source-string confidence recomputation with a human-approved trust ledger
- fingerprint material page content and evidence while excluding validated volatile confidence/lifecycle bookkeeping
- make CLI and direct `lint_vault()` calls fail closed when the trust ledger is missing or malformed
- distinguish stale pages, unreviewed pages, and score mismatches
- support approval-gated full and partial trust recording without clearing unrelated stale entries
- validate exact typed-relationship targets independent of YAML key order and reject ambiguous basenames
- exclude reserved/bootstrap/VCS scaffolding from content-health findings
- update `wiki-lint`, `llm-wiki`, and README guidance to forbid automatic confidence rewrites

## Why

Independent evidence lineages and whole-page claim coverage are semantic judgments. Counting source strings overstates confidence when multiple records come from the same repository, task chain, snapshot origin, or conversation. A deterministic classifier should validate an approved review, not pretend to reproduce that judgment from URLs.

## Safety model

- `trust-record` requires both `--approved` and an explicit `--all` or repeatable `--page` selection.
- Partial recording updates only selected pages and preserves unrelated stale entries.
- All non-reserved content pages participate in trust coverage, including pages missing required trust fields.
- Ledger JSON rejects duplicate keys, non-object roots/entries, non-standard numbers, booleans, invalid paths, invalid timestamps, malformed fingerprints, and unsupported schema/method values.
- Frontmatter rejects duplicate trust keys, nested data under excluded volatile keys, invalid confidence/lifecycle values, malformed `updated` dates/timestamps, and malformed UTF-8.
- Material changes become stale; score-only changes become failing mismatches.
- Ledger writes reject symlinked parents/destinations and use random exclusive temporary files; POSIX writes use directory file descriptors and `O_NOFOLLOW`.
- `lint_vault()` requires the ledger by default; `trust-check --strict` is documented for CI and scheduled gates.
- `--approved` is explicitly documented as a workflow assertion rather than a cryptographic signature; ledger diffs remain version-controlled and human-reviewed.
- Automatic confidence changes and automatic `trust-record` execution are explicitly prohibited.

## Test plan

- [x] `python3 -m pytest -q` — 208 passed, 11 subtests passed
- [x] targeted Ruff checks for trust/lint implementation and tests
- [x] `python3 -m compileall -q obsidian_wiki tests`
- [x] `git diff --check`
- [x] wheel build includes `obsidian_wiki/trust.py` and `obsidian_wiki/lint.py`
- [x] adversarial tests: symlinked `_meta`/destination/temp, duplicate/nested frontmatter, duplicate JSON keys, NaN/boolean/out-of-range scores, malformed `updated`/review timestamps, fingerprints, paths and UTF-8, missing trust fields, target-first and dash-only relationships, unknown relationship fields, ambiguous basenames, and normalized qualified-path collisions
- [x] live 44-page vault: 44 reviewed, 0 stale/unreviewed/mismatch/errors
- [x] live deterministic lint: all finding counts 0
- [x] fresh independent read-only adversarial review: passed, 0 security concerns, 0 logic errors

## Compatibility

Trust enforcement is now fail closed by default for both CLI and direct `lint_vault()` callers. Callers performing isolated structural checks without an approved ledger must opt out explicitly with `require_trust_ledger=False`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2cc64265e521`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.