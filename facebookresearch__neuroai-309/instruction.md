# Issue

**Title:** neuralbench: keep fMRI MLP task shape settings

## Description

The shared `fmri_mlp` model config now only selects the `FmriMlp` class instead of replacing the whole `brain_model_config`. Each fMRI task keeps its own temporal length and output head, so `-m fmri_mlp` no longer imposes the image task's four-TR, 1536-dimensional settings on other tasks.

`fmri image` resolves to the same configs and cache UIDs as before, with and without `-m fmri_mlp`.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4abbcfdad069`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.