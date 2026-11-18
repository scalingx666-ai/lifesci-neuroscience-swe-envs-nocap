# Issue

**Title:** [FIX] Broken scaffold no more

## Description

- [x] When dcm2bids_scaffold was ran multiple times, it appended data inside the generated files multiple times instead of overwriting it when using `--force`. 
- [x] The URL for the README was the the raw README, so HTML was being parsed, fixed that as well.
- [x] There was no logging, so I added some, including a tree representation of the output_dir in which the scaffold was done. No additional dependency was added.
- [x] Create a `.bidsignore` which include `tmp_dcm2bids` that is not valid, partially answering a comment brought up in #195

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86f89e31f773`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.