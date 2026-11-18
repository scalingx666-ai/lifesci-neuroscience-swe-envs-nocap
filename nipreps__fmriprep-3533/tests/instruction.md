# Issue

**Title:** chore(ci): Check pixi lock

## Description

Unlike `uv sync --frozen`, `pixi install --frozen` does not seem to check whether the lock file is out-of-sync with `pyproject.toml`. This adds a small job to the Docker build workflow to run `pixi lock --check`.

It should fail, and then I'll run `pixi.lock`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59bf839723aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.