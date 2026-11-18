# Issue

**Title:** Add `--dummy-scans` parameter to CLIs

## Description

.

Changes proposed in this pull request:

- Add `--dummy-scans` parameter to tedana, t2smap, and ica_reclassify CLIs. The default is 0, so this doesn't change the default behavior.
- Add `dummy_scans` argument to `load_data` and `load_validate_external_regressors`. I made it so the dummy scans may or may not already be removed from the external regressors.
- Require argument names in calls to `load_validate_external_regressors` and `validate_extern_regress`. These are internal functions, so I think it just makes it clearer what arguments are being passed in, and it shouldn't affect the user experience at all.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82a7b25ab6e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.