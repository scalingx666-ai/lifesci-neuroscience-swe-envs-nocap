# Issue

**Title:** Refine broad method selection workflow

## Description

## Summary

- integrate broad, evidence-backed method discovery into PI, Librarian, Experimentalist, and Engineer prompts
- distinguish operational feasibility from decision-relevant evidence and use staged comparison without fixed task-specific thresholds
- generalize the Auditor validation skill and audit packet around method coverage, fair pruning, evidence representativeness, and claim scope
- keep all prompt and skill guidance in English and avoid BCI-specific rules

## Validation

- `npm test -w @brainpilot/runtime` (603 passed)
- `npm run typecheck -w @brainpilot/runtime`
- Auditor skill `quick_validate.py`
- `npm pack -w @brainpilot/plugin-auditor --dry-run --json`
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76239d778f2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.