# Issue

**Title:** neuralbench: LP-FT and attentive downstream wrapper presets

## Description

Adds linear-probe-then-fine-tune (LP-FT) and attentive-pooling presets for foundation-model adaptation (`-w`):

- `DownstreamWrapper.unfreeze_at_epoch` and an `UnfreezeAtEpoch` callback: train the head on a frozen backbone, then fine-tune everything from the given epoch. The callback is attached by `BrainModule.configure_callbacks` and keeps the frozen parameters registered with DDP so their gradients synchronise after unfreezing. `unfreeze_at_epoch` must be positive, cannot be combined with LoRA, and warns when past `max_epochs`.
- New presets: `lpft_mean`, `lpft_flatten`, `lpft_attentive` (all unfreeze at epoch 3), `finetune_attentive`, `lora_r4_attentive`. Attentive-pooling runs are tagged `<strategy>_attentive` in `eval_mode`.
- Plots: the bar-chart legend shows each foundation model's adaptation strategy; two-tone rank labels are drawn as one packed box.
- Docs: `full_benchmark.rst` lists the new presets.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7082e9c80ede`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.