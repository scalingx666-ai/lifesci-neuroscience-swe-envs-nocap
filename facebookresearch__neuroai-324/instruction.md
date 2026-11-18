# Issue

**Title:** Braindecode 2.0 compatibility

## Description

.

- Skip `route_bypassed_qkv_lora` on braindecode > 1.8.1 (LaBraM now calls `self.qkv(x)`, so the qkv LoRA delta was applied twice), plus a regression test.
- `labram.yaml`: `use_mean_pooling: false` to keep the 1.8.1 pretrained readout.
- `model_params.json`: Deep4Net 146025 → 145900.
- Drop the braindecode `exclude-newer` pin.

Tested: `pytest neuralbench` on braindecode 2.0.0dev0 (415 passed); `neuralbench/test_modules.py` on 1.8.1 (39 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70a5b7f6007d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.