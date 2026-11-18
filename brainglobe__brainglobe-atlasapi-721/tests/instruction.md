# Issue

**Title:** fix: recover from corrupted atlas metadata on initialization

## Description

## Description

### What is this PR
- [x] Bug fix

### Why is this PR needed?
If an atlas installation crashes during extraction, the local atlas directory can be left in a partially extracted state with a missing or corrupted `metadata.json`.  

Currently this causes `BrainGlobeAtlas` initialization to crash, requiring users to manually delete the atlas directory and reinstall ,which is not user-friendly.

### What does this PR do?
- Adds recovery logic during `BrainGlobeAtlas` initialization:
  - Detects missing or corrupted `metadata.json`
  - Removes the partially extracted atlas directory
  - Re-downloads the atlas once and retries initialization
- Uses a bounded retry loop (no recursion) to avoid infinite retries
- Leaves behavior unchanged for valid atlas installations

### References


### How has this PR been tested?
- Added a unit test that simulates a missing `metadata.json` by mocking `Atlas.__init__`
- Verified the atlas is re-downloaded and initialization succeeds
- Ran `pytest` locally and confirmed existing tests pass

### Is this a breaking change?
No.  
This change only affects recovery from corrupted atlas installs.

### Does this PR require an update to the documentation?
No.  

## Checklist:
- [x] The code has been tested locally
- [x] Tests have been added to cover the new recovery behavior
- [x] The code has been formatted with pre-commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a83e4f00ca85`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.