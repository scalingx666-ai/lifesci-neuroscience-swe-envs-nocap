# Issue

**Title:** Avoid warning when searching for empty-room files

## Description

I think this one is too small for a changelog update, but sometimes calling
```
bids_path.find_matched_empty_room()
```
would emit a warning about IAS data. This avoids it by using `extra_params` earlier in the call.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `766811936b2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.