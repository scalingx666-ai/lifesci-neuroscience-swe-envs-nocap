# Issue

**Title:** Update Infant Recon All

## Description

1. Changed default output dir to be at SUBJECTS_DIR/subj
2. fixed issue with the pipeline breaking when output directory was defined and input directory was not
3. added try/except clause to reset envvars if pipeline fails

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74529ed85f32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.