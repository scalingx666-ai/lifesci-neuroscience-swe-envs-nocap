# Issue

**Title:** Fix false equivalence in loop detection iso groups

## Description

## Summary
- Add `_refine_iso_groups` to split BFS iso groups where members occupy structurally different positions (e.g., `sin(x)` in a loop body vs `sin(y)` in a branch) by checking direction-aware neighbor connectivity
- Add `NestedParamFreeLoops` test model exercising nested loops with equivalent inner operations
- Suppress pre-existing F841 lint warnings in test models where unused variables intentionally create computational graph operations

## Context
When operations share the same `operation_equivalence_type` but occupy different structural positions, the BFS expansion incorrectly groups them into the same iso group. This caused `VaryingLoopNoParam2` to fragment sin operations into wrong groups instead of correctly separating `sin(x)` (8 passes) from `sin(y)` (3 passes).

The fix uses a post-BFS refinement pass that computes `(direction, iso_leader)` tuples for each member's neighbors and splits groups into connected components — members that share at least one directional neighbor iso group stay together.

## Test plan
- [x] `test_varying_loop_noparam2` passes (was xfail)
- [x] `test_nested_param_free_loops` passes (new test)
- [x] All 90 existing tests pass with no regressions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b48aca8f4a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.