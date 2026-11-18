# Issue

**Title:** feat(research): harden PI workflow planning

## Description

## Summary
- add a PI workflow controller for multi-stage, resumed, and failure-prone research
- distinguish prescribed, empirical, and evidence-limited model-selection modes
- cover recovery, evidence invalidation, scope changes, provider failures, and audit revisions
- remove duplicated procedural detail from the core PI persona

## Validation
- all 9 research skills pass quick_validate.py
- @brainpilot/runtime: 703 tests passed
- plugin package dry-run includes the new skill

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ecb4862784e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.