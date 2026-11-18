# Issue

**Title:** Fix evidence-driven method selection

## Description

## Summary
- distinguish externally fixed methods from comparative selection
- separate candidate eligibility guards from ranking evidence and require challengers to be able to change the decision
- invalidate stale decisions after result corrections and inject freshness rules into legacy Engineer/Experimentalist prompt overrides
- require Auditor to verify the selected candidate against the latest corrected comparison without choosing a replacement itself

## Validation
- `npm run typecheck`
- `npm test` (104 files, 1111 tests)
- `npm test -w @brainpilot/web` (66 files, 546 tests)
- `npm run build -w @brainpilot/web`
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c351780f0842`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.