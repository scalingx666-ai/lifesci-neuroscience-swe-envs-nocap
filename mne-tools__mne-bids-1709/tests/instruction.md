# Issue

**Title:** [MRG] FIX: Ignore participant ages that cannot produce a birthday

## Description

Keep BIDS reads working when participant ages cannot produce a valid birthday.

The age fallback leaves birthday unset and preserves other participant fields.

Extracted from

Validation: 98 read tests passed; pre-commit passed across all files. The new regression covers valid ages, `n/a`, `nan`, `inf`, and an age that would put the birthday outside the supported date range.

AI assistance: Codex extracted the fix, added regression tests and prepared this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d437a0036947`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.