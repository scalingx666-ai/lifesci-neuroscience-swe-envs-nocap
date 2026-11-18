# Issue

**Title:** Refine adaptive research workflow prompts

## Description

## Summary
- make PI planning budget-aware while preserving mandatory expert delegation and the absolute PI training prohibition
- make Experimentalist protocols proportional to the actual task, deployment objective, and compute budget instead of defaulting to exhaustive designs
- allow Engineer to make documented, protocol-bounded execution reductions without dropping essential comparisons
- add comparison coverage, proxy-objective, and adaptation checks to the Auditor-only skill while keeping Auditor out of core personas
- trim methodology-skill guidance so skills ground relevant decisions without expanding experiment scope

## Validation
- `npm test -- --run --project @brainpilot/runtime` (569/570 on the first full run; one unrelated ask_user timing test failed, then its entire file passed 15/15 on immediate rerun)
- `npm test -- --run packages/runtime/src/__tests__/personas.test.ts packages/runtime/src/__tests__/system-plugins.test.ts` (33/33)
- `npm run typecheck`
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d01856fd47be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.