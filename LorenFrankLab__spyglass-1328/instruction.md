# Issue

**Title:** Cleanup Update: exit on fail to `chmod`

## Description

# Description

- `cleanup.py`: Add print statements for each step to track progress in the log
- `spikesorting_*.py`: Add optional arg to disable tqdm progress bar in the log
- `run_jobs.sh`: On failure to chmod files, send an email and exit.

Previously, the jobs script would continue to python execution even if chmod
failed, which would cause silent failures later, preventing cleanup.

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a If table edits, I have included an `alter` snippet for release notes.
- [X] N/a If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11cb77cdca83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.