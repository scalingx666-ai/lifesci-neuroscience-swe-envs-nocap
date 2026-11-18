# Issue

**Title:** feat: add `--[no-]track-sessions` flag to lessen session label strictness

## Description

Addresses #3613 #3601 #3581 

Supersedes #3606 

Adds a new command line option `--track-sessions` (and to disable, `--no-track-sessions`) to explicitly control the use of session ID within the workflow.

If enabled, requested or found session(s) propagated:
working directory -> `fmriprep_25_2_wf/sub_01_ses_pre_wf/`
FreeSurfer ID -> sub-01_ses-pre
Constrained filtering -> filtering by `session` is not allowed

If disabled, requested or found session(s) omitted:
working directory -> `fmriprep_25_2_wf/sub_01_wf/`
FreeSurfer ID -> sub-01
Free filtering

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16a8b2941600`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.