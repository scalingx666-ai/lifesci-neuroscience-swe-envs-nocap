# Issue

**Title:** Cellfinder with Keras 3.0 and jax backend

## Description

With this PR, cellfinder tests pass with Keras 3.0 and both the tensorflow and the JAX backend 🥳 

Specifically:
- I added checks similar to previously existing ones, that checked if `tensorflow` was installed in the environment before importing `cellfinder`. Now we check if `keras` is installed, and if it has an appropriate backend installed. I modified the CI check accordingly.

- I configured tox to run tests using the tensorflow backend and the JAX backend.

- for the brainmapper tests we run in CI, I added a `pip install` step that installs the (for now pinned) tensorflow version compatible with Keras 3.0.0. I am (temporarily) setting tensorflow as the default backend for Keras if none is defined.

- for the time being I pinned Keras and TF to specific versions, but happy to inspect that further in a future PR (in theory TF 2.15 [should be compatible](https://keras.io/getting_started/#compatibility-matrix) with Keras 3.0.0)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ad5c1bd5be8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.