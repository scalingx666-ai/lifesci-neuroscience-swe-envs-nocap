# Issue

**Title:** fix(runtime): fall back when skill_name is empty

## Description

## Summary

- treat empty and whitespace-only `skill_name` values as absent so query mode falls back to keyword search
- trim non-empty skill names before exact lookup
- add regression coverage for empty, whitespace-only, and padded skill names

## Testing

- `npm test -- packages/runtime/src/__tests__/skill-search.test.ts`
- `npm run typecheck -w @brainpilot/runtime`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `710deec74638`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.