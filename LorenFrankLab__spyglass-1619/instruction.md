# Issue

**Title:** Nonlocal detector conditional import

## Description

# Description

New environments have the following dependency conflict

* `non_local_detector` -> `jax` -> `numpy>=2`
* `spikeinterface==0.99.1` -> `numpy<2`

It occurs in the CICD at data ingestion ....

1. `insert_sessions` 
2. -> `populate_all_common` 
3. -> `declare_all_merge_tables` 
4. -> `spyglass.decoding.decoding_merge` 
5. -> `non_local_detector.visualization.figurl_1D` 
6. -> `jax=>0.9` 
7. -> `numpy>=2`

This PR migrates all `non_local_detector` dependencies until #1609 

# Checklist:

- [X] N/a. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/a. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [ ] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79c17582610b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.