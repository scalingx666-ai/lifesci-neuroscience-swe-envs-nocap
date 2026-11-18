# Issue

**Title:** [MAIN] Use micromamba GitHub action in CI jobs

## Description

Conda-based CI jobs in Elephant use the `conda-incubator/setup-miniconda` action, which installs the environment definition in the YAML file and allows using `mamba` for the final installation of the test environment.

Recently, the CI jobs based on conda (`test-conda` and `docs`) failed, apparently due to an error in the `setup-miniconda` action.

This PR updates the CI workflow to use the [mamba-org/setup-micromamba](https://github.com/marketplace/actions/setup-micromamba) GitHub action, which provides `micromamba` (a lightweight version of `mamba`) and serves as a replacement for `setup-miniconda`. This also makes the CI independent of Miniconda.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `febc7ce6b30c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.