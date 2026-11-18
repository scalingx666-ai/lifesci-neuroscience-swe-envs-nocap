# Issue

**Title:** Update writer.rs to raise error from `File::create` on `write_nifti`

## Description

I might have overlooked this line back when reviewing #21. Failure to create the file should surely be recoverable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd363635c7d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.