# Issue

**Title:** ENH: Speed up get_datatypes

## Description

First commit shows the problem: all files are traversed. It does so by fixture-izing the dense dir structure used in the efficiency tests elsewhere. This should come back green.

Once it does, I'll push a commit to trim it just to look at `bids_root/sub-*/(session-*/)<modality>`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ab8058a3d5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.