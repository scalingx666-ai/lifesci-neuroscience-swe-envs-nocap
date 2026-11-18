# Issue

**Title:** Fix: check for None instead of false value in sort_ref_id (current line raises exception if electrode 0 is set to reference)

## Description

# Description
- Fix: Checks for None instead of false value. 
    - `src/spyglass/spikesorting/utils.py`: Change to check for is None rather than not. I think this should fix the issue. 

# Checklist:
- NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- NA If this PR makes changes to position, I ran the relevant tests locally.
- NA If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- NA I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d1942eb7b73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.