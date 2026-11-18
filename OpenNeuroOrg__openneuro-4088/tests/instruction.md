# Issue

**Title:** doc: Add terms that uploaded data must be real recordings

## Description

Small update to the terms of service to require imaging data to be actual recordings, not synthetic. I do carve out synthesis for the sake of defacing/refacing, which is arguably synthetic. By specifying "imaging data", I mean to allow synthetic stimuli.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85801be5d100`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.