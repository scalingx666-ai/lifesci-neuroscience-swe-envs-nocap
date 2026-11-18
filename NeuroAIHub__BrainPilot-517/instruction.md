# Issue

**Title:** fix(research): defer final candidate selection

## Description

## Summary
- treat baselines and validated fallbacks as non-preferred continuity artifacts
- keep exploration focused on eligibility and evidence acquisition, then select once from a frozen final comparison snapshot
- keep Engineer evidence tables recommendation-free and require snapshot revisions
- make Auditor reject early preferences that changed candidate coverage, effort, pruning, or interpretation
- update the audit request packet with fallback, frozen snapshot, decision record, and pre-freeze allocation evidence

## Validation
- npm run build
- npm run typecheck
- npm test (106 files, 1119 tests)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75ce73f8829d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.