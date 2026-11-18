# Issue

**Title:** perf(postprocess): optimize pipeline for large models

## Description

## Summary

- **Per-step verbose timing (O16)**: Unwrap grouped `_vtimed` blocks into individual step timing with graph-stats summary line and total elapsed time, so users can identify which specific step is slow
- **Cache module_str (O8)**: Avoid redundant `"_".join()` in Step 6 for layers sharing the same module context
- **Early-continue guards (O5)**: Skip `get_vars_of_type_from_obj` BFS in Step 13 when `captured_args`/`captured_kwargs` are None/empty
- **Pre-compute buffer_layers_by_module (O6)**: Eliminate O(modules × buffers) → O(modules + buffers) in Step 17
- **Single-pass arglist rebuild (O2)**: Replace 3-pass enumerate + index set + filter with single-pass list rebuild in Step 11
- **Replace OrderedDict with dict (O4)**: Lower allocation overhead in `_trim_and_reorder` (Python 3.7+ preserves insertion order)
- **Reverse-index iso group refinement (O9)**: O(members × avg_neighbors) instead of O(members²) all-pairs combinations in `_refine_iso_groups`
- **Pre-compute subgraph param types (O10)**: Build `frozenset` per subgraph once before pair loop in `_merge_iso_groups_to_layers`
- **Set-based collision detection (O12)**: O(n) duplicate detection replacing O(n²) `.count()` in `_find_isomorphic_matches`

## Test plan

- [x] All 18 smoke tests pass
- [x] 795 non-slow tests pass (excluding pre-existing flaky signal test and 250k-node timeout tests)
- [x] Ruff lint and format clean
- [x] Import check passes

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd8b348f5c30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.