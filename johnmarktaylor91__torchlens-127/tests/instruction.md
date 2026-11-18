# Issue

**Title:** fix(vis+postprocess): ELK layout stack overflow + conditional branch detection

## Description

## Summary
- **ELK layout fix**: Use Worker thread for ELK layout to avoid Node.js stack overflow on large graphs
- **Bug #88 fix**: `_mark_conditional_branches` flooded bidirectionally (parents + children), causing non-conditional nodes' children to be falsely marked as `in_cond_branch`. Fix restricts flooding to `parent_layers` only (backward-only)
- **THEN branch detection**: When `save_source_context=True`, AST analysis identifies which children of a branch-start fall within the `if`-body line range, labeling them as THEN branches with edge labels in visualization
- **Bonus**: Fixes missing `verbose` in `MODEL_LOG_FIELD_ORDER`

## Test plan
- [x] 22 new tests in `TestConditionalBranchDetection` — all pass
- [x] 728 tests pass across 10 test files (full regression)
- [x] 18 smoke tests pass
- [x] FIELD_ORDER sync tests now pass (were failing on main due to missing `verbose`)
- [ ] Manual visual inspection of IF/THEN labels in rendered graph

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c15b6b05642`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.