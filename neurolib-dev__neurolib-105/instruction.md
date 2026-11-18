# Issue

**Title:** Fix: thalamus

## Description

The thalamic model now works with `autochunk`. This was resolved by manually casting all necessary thalamic outputs into 2D.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14a768c1c30f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.