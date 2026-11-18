# Issue

**Title:** chore: Add readthedocs configuration for doc previews in PRs

## Description

This switches from a `docs/requirements.txt` that provides version constraints to a `uv.lock` file that pins specific versions. We haven't had issues with upstream breaking our doc build, I don't think, but this heads it off.

The main purpose is so that we can get rendered PR builds from readthedocs. The GHA builds verify that the build does not error, but don't let us view the changes.

RTD will not start working until we have a `.readthedocs.yaml` in the `master` branch, so this should be judged based on not breaking the GHA build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c9b6c244d36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.