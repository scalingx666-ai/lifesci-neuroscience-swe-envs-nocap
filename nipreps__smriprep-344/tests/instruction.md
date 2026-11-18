# Issue

**Title:** MNT: Add `sloppy` argument to workflows, distinguish from `debug`

## Description

This adds `sloppy` to the anatomical workflow (and all necessary children), and distinguishes between `debug`, which produces intermediate outputs to facilitate debug certain preprocessing steps (currently none), and `sloppy`, which sacrifices algorithmic performance for speed.

ATM, `debug` has no options, but I left it open to future additions.

Needed for

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0cd77e3545d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.