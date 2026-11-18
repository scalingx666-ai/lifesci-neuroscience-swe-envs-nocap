# Issue

**Title:** fix(e2e): normalize agent smoke status to lowercase "pass"/"fail"

## Description

## Summary

Extraction gates check `smoke === 'pass'`, but the schema accepted any string. Agents often returned text like `"PASS (exit 0) ..."`, so a passing unittest was treated as a failed extraction and the kernel was skipped for optimization.

## Changes

- Restrict `smoke` / `unittest_smoke` to `"pass"` or `"fail"` via schema `enum`; other values are rejected and the agent must re-answer.
- Add a `smoke_detail` field for free-text details.
- Document the rule in `kernel_extractor.md`.
- Add `test_smoke_status_contract.js` to CI L0.

## Test

- New test passes on this branch and fails on `main`.
- Existing JS tests pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b814972a91d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.