# Issue

**Title:** Drop Python 3.10 support

## Description

Python 3.10 reaches [end of life](https://devguide.python.org/versions/) this month. This PR peels the Python floor change off #4260 (Support zarr v3), so that the diff there gets simpler: it sets `requires-python = ">=3.11"` and moves the workflows that ran on 3.10 to 3.11.

The deepinterpolation workflow can no longer run on pull requests: it pins tensorflow 2.8.4, which has no wheels for Python 3.11 or newer, so I switched it to manual only, as #4260 also does. if no champion comes in some releases we should drop this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bb6beccfceb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.