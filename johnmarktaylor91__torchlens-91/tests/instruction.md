# Issue

**Title:** fix(core): handle DataParallel, device mismatch, and embedding perturbation

## Description

## Summary
- **Unwrap `nn.DataParallel`** at entry points (`log_forward_pass`, `show_model_graph`, `validate_saved_activations`) — fixes CORnet models
- **Auto-move inputs to model device** with recursive `_move_tensors_to_device` supporting dict/UserDict/BatchEncoding — fixes sentence_transformer CUDA mismatch
- **Exempt `embedding` index arg from perturbation** (`STRUCTURAL_ARG_POSITIONS`) — prevents CUDA OOB from random indices during validation

Also required env upgrades (not in diff): PyTorch 2.10→2.8, PyG 2.4→2.7, pennylane 0.36→0.44, h5py/matplotlib for numpy 2.x compat.

## Tests fixed (9)
- `test_cornet_z`, `test_cornet_s`, `test_cornet_r`, `test_cornet_rt` — DataParallel unwrap
- `test_sentence_transformer` — device migration + embedding exemption
- `test_dimenet` — PyG upgrade (numpy.math removal)
- `test_qml` — pennylane/autograd upgrade (numpy.msort removal)
- `test_vit`, `test_fcos_resnet50_eval` — PyTorch downgrade

## Test plan
- [x] All 9 previously failing tests pass (9/9 passed, 180s)
- [ ] Full suite regression check

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11a791185a78`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.