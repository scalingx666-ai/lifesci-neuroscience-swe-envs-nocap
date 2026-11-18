# Issue

**Title:** Allow retrying conversion jobs

## Description

### Summary
 - Retrying convert_to_wkw jobs would previously always fail because the publish step would be rejected.
 - This was because on failure, a cleanup would delete the reserved preliminary dataset completely. Now it is instead set to the status “Conversion failed.”. and this status is allowed for a subsequent publishToPreliminary step.
 - Datasets with this status are still listed in the dashboard, but under “Missing”/unreported.
 - The dataset directory name stays reserved now, but that should be fine, since those tend to include unique ids now anyway.

### Steps to test:
(I tested locally)
- Upload a tiff dataset, conversion should pass
- Upload something broken, conversion should fail, retry should fail again
- Upload a tiff dataset, but introduce error in worker code. conversion should fail. fix the worker, restart it, retry the job. Should now pass.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25be04218dc9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.