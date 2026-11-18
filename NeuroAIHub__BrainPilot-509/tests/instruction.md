# Issue

**Title:** fix(research): preserve viable method families

## Description

## Summary
- distinguish scientific principles, method families, and concrete implementations in Librarian surveys
- require Experimentalist protocols to retain a feasible representative of each credible method family
- make Auditor reject family-level exclusions supported only by implementation-specific limitations

## Validation
- npm run build
- npm run typecheck
- npm test (106 files, 1118 tests)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9af0cc27ee27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.