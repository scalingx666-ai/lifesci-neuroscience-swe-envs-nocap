# Issue

**Title:** Remove pre-existing units from analysis files

## Description

# Description

 
- existing units in the raw nwb file previously were retained in analysis nwb files created from it
- This caused issues when spike sorting in spyglass and saving results to analysis nwb files
- This removes any pre-exisitng units when creating an analysis nwb file to avoid

# Checklist:

- [ ] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [ ] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [ ] NA If this PR makes changes to position, I ran the relevant tests locally.
- [ ] NA If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [ ] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3c700526b18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.