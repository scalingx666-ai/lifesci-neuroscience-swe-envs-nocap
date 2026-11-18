# Issue

**Title:** Avoid deprecated `prek auto-update` alias for `scheduled_updates` workflow

## Description

Recent `scheduled_update` runs are failing (e.g., https://github.com/mne-tools/mne-python/actions/runs/34081832811/job/101618439991) due to `prek auto-update` being removed as an alias for `update` in v0.5: https://prek.j178.dev/0.5.2/changelog/#050

Switches it to use `update` directly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8bdd487d87ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.