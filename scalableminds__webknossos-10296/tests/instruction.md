# Issue

**Title:** Restrict AI job custom configuration to super users, add affinity threshold setting

## Description

### Summary
- Custom configuration overrides for AI training, inference and alignment jobs are now super-user only. The UI hides them for everyone else, and the backend rejects a non-empty `customConfiguration` from non-super users with 403.
- Neuron inference gets an "Affinity threshold" advanced setting, open to all users. It is sent as `absoluteAffinityThreshold`, and the backend adds it to `custom_configuration` as `tasks.segment.config.segmenter.absolute_affinity_threshold`, so the worker needs no changes. If a super user sets the same key in the custom configuration, their value wins.

### Steps to test:
- As a non-super user: the AI training tab has no Advanced Settings section. Alignment shows only "Fine alignment only". Neuron inference shows only the affinity threshold (plus evaluation settings for neuron models).
- Start a neuron inference with an affinity threshold set. The job's `custom_configuration` contains `tasks.segment.config.segmenter.absolute_affinity_threshold`.
- As a super user: Custom Configuration is still available for all AI jobs.
- Sending a `customConfiguration` to the API as a non-super user returns 403.

### Issues:
- fixes #

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59beb9ce2d7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.