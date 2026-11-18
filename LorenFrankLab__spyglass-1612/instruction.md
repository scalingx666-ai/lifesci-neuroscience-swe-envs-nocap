# Issue

**Title:** Pin scipy for spikeinterface compatibility

## Description

# Description

CICD on master started failing [here](https://github.com/LorenFrankLab/spyglass/actions/runs/26980856497/job/79619436616)

This PR pins scipy to avoid this issue, until #1609 

# Checklist:

- [X] N/a. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/a. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [X] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe038d7fe306`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.