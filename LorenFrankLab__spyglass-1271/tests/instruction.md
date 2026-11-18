# Issue

**Title:** Revise cleanup scripts

## Description

# Description

- Update cron job to include...
  - running `chmod` on new files
  - cleanup of spikesorting v0 dir
- Update cleanup of `v0.SpikeSorting` to remove untracked files 

Marked as draft pending communal review of would-be-deleted files



# Checklist:

- [x] No. This PR should be accompanied by a release: (yes/no/unsure)
- [x] N/a. If release, I have updated the `CITATION.cff`
- [x] No. This PR makes edits to table definitions: (yes/no)
- [x] N/a. If table edits, I have included an `alter` snippet for release notes.
- [x] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [x] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c1229896737`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.