# Issue

**Title:** MNT build with isolation so setuptools-scm sets the version in docs

## Description

The published docs for 1.4.0 [wrongly show 1.3.0.dev0](https://github.com/gallantlab/pycortex/blob/81394601e0d98b93b9778d438e30b64cea0d2f23/index.html#L8) in the title.

This is because when building the docs with `--no-build-isolation` but without `setuptools-scm`, `cortex.__version__` never gets filled in. It silently falls back to a hardcoded `'1.3.0.dev0'`.

`--no-build-isolation` was added in #385 to work around the numpy 1.20 ABI break. Extensions built against numpy 2 run on numpy 1.x too, so it is no longer needed.

This PR makes 3 changes:
 * It drops `--no-build-isolation` from CI and all instructions; pip now automatically installs all packages listed in `build-system.requires` from pyproject.toml.
 * It sets the fallback version to an obviously-wrong '0+unknown' instead of a real-looking version that goes stale.
 * It bumps the minimum version for `setuptools` to support Python 3.12+. This is needed because we don't explicitly install or upgrade it anymore.

After merging, we should re-publish the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc68d4ccf20d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.