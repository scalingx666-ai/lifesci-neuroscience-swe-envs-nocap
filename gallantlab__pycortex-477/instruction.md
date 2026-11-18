# Issue

**Title:** FIX `cortex.export.plot_panels` correctly shows inflated surfaces for subjects without a flatmap

## Description

If a subject doesn't have a flatmap, then the unfold parameter needs to be 1 in order to get a fully inflated surface.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94936d546a30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.