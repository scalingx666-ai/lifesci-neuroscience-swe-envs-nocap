# Issue

**Title:** Validate and document rest_epochs_duration

## Description

.

When `task_is_rest=True` and `rest_epochs_duration` is not set, configuration
validation now raises a clear error before epoch creation.

The parameter documentation now explains that it sets the length of
fixed-duration resting-state epochs and how `rest_epochs_overlap` is used.

The regression test covers both a missing duration and a valid resting-state
configuration.

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4060cb65eedb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.