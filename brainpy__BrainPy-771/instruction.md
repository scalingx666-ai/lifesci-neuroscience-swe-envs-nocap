# Issue

**Title:** Refactor STDP weight update logic and improve error handling, requiring brainevent>=0.0.4

## Description

## Summary by Sourcery

Refactor STDP weight update logic to use new JAX-based primitives, improve error handling for weight updates, update plasticity pipeline and tests for TrainingMode, and bump minimum versions of brainevent and braintools.

Enhancements:
- Replace Taichi-based STDP kernels with csr_on_pre and csr2csc_on_post primitives and explicit shape arguments
- Require variable weights in stdp_update and remove legacy constant node check
- Convert spike and trace inputs to JAX arrays and access .value in plasticity update
- Raise NotImplementedError for removed tracing_variable feature

Build:
- Exclude docker*, examples, scripts, images, and dist from package discovery

Tests:
- Instantiate connection layers with TrainingMode in STDP tests

Chores:
- Bump brainevent to >=0.0.4 and braintools to >=0.0.7 in setup.py and requirements.txt
- `tracing_variable()` is no longer supported

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e3874fc185a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.