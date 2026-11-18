# Issue

**Title:** fix(research): validate empirical ranking evidence

## Description

## Summary
- trigger evaluation-validity records only for material empirical choices
- admit ranking evidence only when it is adequately linked to the intended claim
- require decision-reversing mismatches to receive discriminating checks
- preserve required delivery while separating it from unsupported superiority claims
- keep screening, diagnostic, and guardrail evidence outside Engineer ranking fields
- make Auditor verify the compact final evidence-to-claim chain

## Validation
- npm run build
- npm run typecheck
- npm test (106 files, 1120 tests)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9773b6568648`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.