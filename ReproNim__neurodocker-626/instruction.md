# Issue

**Title:** FIX use --transform in freesurfer's template to generalize across freesurfer versions to strip leading `freesurfer/` folder

## Description

I guess we'll have to check if the same problem occurs with new freesurfer versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1719727d53a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.