# Issue

**Title:** docs: align README with public technical report

## Description

## Summary
- align the English and Chinese README titles with the public BrainPilot technical report
- link arXiv:2607.15079 and add the report citation
- replace overview, system, knowledge-base, ALE, and BrainPilotBench figures with the final white-background PNG assets
- present ALE and BrainPilotBench-v0 side by side and clarify that all four benchmark tasks are complete while the suite remains preliminary
- update the inventory to 72 skills across 7 major research domains

## Validation
- verified all local README image references
- ran `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a17bba7a8fb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.