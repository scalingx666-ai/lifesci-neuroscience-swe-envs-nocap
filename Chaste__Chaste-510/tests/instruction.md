# Issue

**Title:** Implement PlaneBoundaryCondition in 1D

## Description

- [x] Add jiggle-unsupported exception in 1D — thrown from `SetUseJiggledNodesOnPlane`
- [x] Consolidate jiggle exception assertion into `TestPlaneBoundaryConditionWithNodeBasedCellPopulation1d` (just before node cleanup), removing the separate 1D setup from `TestPlaneBoundaryConditionExceptions`
- [x] Fix misleading block comment in 1D branch (done in prior commit)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0cff083aed91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.