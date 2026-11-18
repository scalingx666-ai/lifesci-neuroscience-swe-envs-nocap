# Issue

**Title:** ENH: add STC PVC to PETPVC interface

## Description

## Summary
This PR adds single-target PVC correction to the PETPVC interface in Nipype. The STC is already included in PETPVC, however, the interface needs to be updated to reflect these changes.



## List of changes proposed in this PR (pull-request)
1. Add the 'STC' option to the 'pvc' flag in the PETPVC interface

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bedb5b48ab24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.