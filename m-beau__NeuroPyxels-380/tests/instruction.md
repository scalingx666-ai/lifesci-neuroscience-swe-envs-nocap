# Issue

**Title:** fix bug in extract_rawChunk so LFPs can be loaded

## Description

Hey guys, thanks for the awesome work with this.

This PR is a fix for a bug (I think) in `extract_rawChunk`. Previously, regardless of what you set the `filt_key` argument to, the highpass filtered data would be loaded. This fix allows you to also load lowpass filtered data too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d612e081be5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.