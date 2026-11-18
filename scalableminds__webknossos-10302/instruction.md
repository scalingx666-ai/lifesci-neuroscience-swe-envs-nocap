# Issue

**Title:** Update affinity threshold explainer

## Description

### Summary
: the affinity threshold tooltip now says what the setting actually does. Everything below the threshold is treated as background, e.g. myelin or ECS. The changelog entry for #10296 is updated to match.

### Steps to test:
- Open AI analysis with a neuron model, expand Advanced Settings, and check the "Affinity threshold" tooltip.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d16ef2e006d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.