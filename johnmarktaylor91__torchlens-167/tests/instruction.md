# Issue

**Title:** fix(capture): correct fast-mode pass-through detection for in-place modules

## Description

## Summary
- Captures fast-mode module input tensor labels before `orig_forward`, matching exhaustive-mode ordering.
- Prevents in-place modules such as `nn.ReLU(inplace=True)` from being misclassified as pass-through modules and injecting spurious `identity_*` ops.
- Adds focused two-pass regression coverage for in-place modules, function-level in-place ops, multi-in-place stacks, true `nn.Identity`, and ResNet50.

## Diagnosis
- Grounded in `.project-context/research/two_pass_diagnostic_2026-04-27.md`.
- Likely regression source: commit `326b8a90`.

## Fixed Patterns
- Small CNNs with `nn.ReLU(inplace=True)`.
- Function-level in-place ops such as `torch.relu_(x)` inside custom modules.
- Multi-layer stacks with repeated in-place ReLU modules.
- ResNet50 default in-place ReLU modules, including selectors `['conv2d_1_1']`, `['linear_1_175']`, and `[-1]`.

## Not Regressed
- True `nn.Identity` modules are still detected as pass-throughs and remain structurally aligned in two-pass mode.

## Validation
- `pytest tests/test_two_pass_inplace_fix.py -m "not slow" -v`
- `ruff format .`
- `ruff check . --fix`
- `mypy torchlens/`
- `pytest tests/ -m smoke -x --tb=short`
- `pytest tests/ -m "not slow" -x --tb=short`
- `pytest tests/test_two_pass_inplace_fix.py::test_two_pass_succeeds_with_resnet50_inplace_relu_modules -v`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19cf533691fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.