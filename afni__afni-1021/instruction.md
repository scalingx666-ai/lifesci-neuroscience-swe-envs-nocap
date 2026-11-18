# Issue

**Title:** afni_open -e: respect EDITOR,VISUAL env vars

## Description

Also, editors like vi, vim and nano should open in the foreground.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22cef6bd1446`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.