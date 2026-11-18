# Issue

**Title:** [ci] Fix ci to be compatible with jax 0.5.0 version

## Description

This pull request includes several changes to the CI workflow, testing, and dependencies to ensure compatibility with the new JAX 0.5.0 version. The most important changes include commenting out specific JAX installation lines in the CI workflow, skipping tests that are incompatible with JAX 0.5.0, and updating the `requirements-dev.txt` file with specific version constraints.

### CI Workflow:
* Commented out the installation lines for `jax` and `jaxlib` in the `.github/workflows/CI.yml` file to prevent conflicts with the new JAX version.

### Testing:
* Added a `pytest.skip` statement to skip tests in `brainpy/_src/dyn/others/tests/test_noise_groups.py` due to incompatibility with JAX 0.5.0.

### Dependencies:
* Updated `requirements-dev.txt` with specific version constraints for various packages to ensure compatibility with JAX 0.5.0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a08ad4848c80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.