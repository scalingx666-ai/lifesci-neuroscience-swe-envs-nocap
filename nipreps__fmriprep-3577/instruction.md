# Issue

**Title:** fix: Ensure multi-echo processing and slice timing correction text is in boilerplate

## Description

.

## Changes proposed in this pull request

- Change `init_bold_native_wf` from a Nipype Workflow to a Niworkflows LiterateWorkflow to make descriptions from workflows called within it accessible.
- Add a reference for tedana.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab9bf3bf3bd2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.