# Issue

**Title:** Bump Python version for `ty` runs

## Description

Bump `ty` to use latest available Python version by default. Also bump `scheduled_updates.yml` to setup `uv` with Python 3.14 for `prek-action` consistency.

We should see the `ty` check fail here, which we can fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `640444800a91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.