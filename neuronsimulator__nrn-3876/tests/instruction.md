# Issue

**Title:** Allow an empty wheel image tag prefix

## Description

## Summary

The wheel-image dispatch form rejects a blank tag prefix because that input is required. The official tags need an empty prefix: `manylinux_2_28_x86_64` and `manylinux_2_28_aarch64`.

Set `required: false` on `prefix` in `.github/workflows/wheel_image.yml` and leave `default: ''`. `docs/install/python_wheels.md` already says to leave the field empty.

. The build with upload off succeeded in https://github.com/neuronsimulator/nrn/actions/runs/36496830642.

## Test plan

- [x] Open **Build custom Docker image for manylinux wheels** on this branch and confirm the prefix field can be left blank. No need to run the build again; both architectures already built from `master`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6f13d863a12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.