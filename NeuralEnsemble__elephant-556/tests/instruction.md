# Issue

**Title:** Multitaper psd segmentation

## Description

This PR separates `multitaper_psd()` with segmentation into `segmented_multitaper_psd()` and  `multitaper_psd()` without segmentation to match the approach used in #525.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8aab43c8e5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.