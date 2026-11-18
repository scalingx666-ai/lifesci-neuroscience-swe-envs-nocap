# Issue

**Title:** Reject duplicate event_id values when constructing Epochs

## Description

- , addressing

We are now raising on construction instead of at load_data.

When epochs are read, I opted for a warning instead of raising, for backward compatibility reasons.

I decided against the warning in events_from_annotations, as there is at least one example currently open, where it's being used (tutorials/clinical/60_sleep.py)

Claude Opus 5.5 High helped with writing the code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3e0db8150f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.