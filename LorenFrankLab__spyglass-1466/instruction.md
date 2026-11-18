# Issue

**Title:** Imported compass direction

## Description

# Description

 
- Defines new table `RawCompassDirection`
- ingests each spatial series in a pynwb `CompassDirection` object as a entry
- Makes an `IntervalList` entry following the naming `compass {x} valid times`
- Implements tests

# Checklist:

- [x] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] NA If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5120f9baf83f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.