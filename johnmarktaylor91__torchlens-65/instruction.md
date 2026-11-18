# Issue

**Title:** refactor(loops): loop detection hardening + children_tensor_versions fix

## Description

## Summary

- **Loop detection refactor**: Rename 10 functions + 6 variables to clearer names, add `SubgraphInfo` dataclass, replace `list.pop(0)` with `deque.popleft()`, rewrite `_get_hash_from_args` to preserve positional indices/kwarg names/dict keys, remove ungrouped sweep and vestigial `index_in_saved_log` field
- **Children tensor variations**: Generalize `was_getitem_applied` to `has_child_tensor_variations` — runtime mismatch detection that catches any case where a parent's `tensor_contents` diverges from what children actually received (getitem slicing, view mutations, in-place ops)
- **Stale pass assignment fix**: `_rebuild_pass_assignments` cleanup step after loop detection — multiple rounds of `_expand_isomorphic_subgraphs` can reassign nodes to new groups while leaving stale `same_layer_operations` in old group members, causing duplicate `layer:pass` labels and validation failures
- **Validation fixes**: Proper complex tensor perturbation via `torch.complex()`, fix bool tensor crash by reordering `.float().abs()`
- **Test infrastructure**: Split `test_real_world_models.py` into fast/slow files, add 12 edge-case loop detection models, add 6 view-mutation stress tests

## Test plan

- [x] `pytest tests/test_toy_models.py` — 96 passed
- [x] `pytest tests/test_metadata.py` — 44 passed
- [x] `pytest tests/test_real_world_models_slow.py::test_fasterrcnn_mobilenet_train` — passed (8+ min)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88900b160fa9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.