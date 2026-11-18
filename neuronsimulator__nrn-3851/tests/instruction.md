# Issue

**Title:** Azure: rename nightly wheels to neuron-nightly

## Description

## Problem

`pip install neuron-nightly` on x86_64 Linux currently has no matching wheel.

x86_64 Linux nightlies are built by Azure `ManyLinuxWheels`, not by GHA `wheels-nightly.yml` (that matrix is only `macos-14` and `ubuntu-24.04-arm`). After #3807 the default `pyproject.toml` name is `neuron`, and GHA nightly remames to `neuron-nightly` before building. Azure did not, so scheduled nightlies produce `neuron-*.whl` and the upload step 403s:

```
Invalid API Token: project-scoped token is not valid for project: 'neuron'
```

Last x86_64 Linux `neuron-nightly` on PyPI was `9.0.2.dev91` (2026-08-05, before #3807). Latest (`9.0.2.dev104`) is ARM-only. Azure scheduled builds (e.g. [16779](https://dev.azure.com/neuronsimulator/nrn/_build/results?buildId=16779)) still compile and test the manylinux x86_64 wheels; only the nightly upload fails.

## Change

- On Azure Manual/Schedule when `NRN_NIGHTLY_UPLOAD` is not `false`, run `change_name.py` to `neuron-nightly` in both `ManyLinuxWheels` and `MacOSWheels`.
- Leave the existing release rename to `neuron` unchanged.
- Update the `pyproject.toml` comment so it matches the #3807 default.

PR/push Azure CI will not run the new step (Manual/Schedule only). That is expected.

## After merge

Trigger the Azure `neuronsimulator.nrn` pipeline on `master` with default nightly variables (`NRN_NIGHTLY_UPLOAD=true`, `NRN_RELEASE_UPLOAD=false`), or wait for the 00:00 UTC cron. Confirm the upload log shows `neuron_nightly-*-manylinux_*_x86_64.whl`, then that those files appear on the latest https://pypi.org/project/neuron-nightly/ version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b902caa3c62b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.