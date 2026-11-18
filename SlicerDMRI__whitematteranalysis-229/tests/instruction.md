# Issue

**Title:** ENH: Fix artifact upload naming conflict

## Description

Fix artifact upload naming conflict:
- Add the label of the required version mode to the artifact name.
- Pin action version.

In v4, artifacts are immutable (unless deleted), so each of the uploaded artifacts needs to have a different name.

Fixes:
```
Error: Failed to CreateArtifact: Received non-retryable error:
Failed request: (409) Conflict:
an artifact with this name already exists on the workflow run
```

raised for example in
https://github.com/SlicerDMRI/whitematteranalysis/actions/runs/7407939750

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b73d07378d30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.