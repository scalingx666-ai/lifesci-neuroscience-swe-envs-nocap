# Issue

**Title:** Recompute: Check matching env based on sorted dict, not fetch

## Description

# Description

- Sort the env dict to avoid false negative matches
- `UserEnvironment` inherits mixin.
- `v1.SpikeSortingRecording` passes hashing precision as a dictionary.
- `SpyglassMixin.delete_orphans` convenience method added.
- `NwbfileHasher` now ...
  - accepts an int as a default precision
  - checks that datasets are numeric before rounding
- `RecordingRecompute`s now have `recheck` methods to double-check keys


# Checklist:


- [X] N/a. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/a. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `245df6f52cee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.