# Issue

**Title:** [Feat] Add the option to interpolate the transport plan with the identity

## Description

This short PR implements an option to interpolate between the transport plan and the identity (as suggested by @bthirion ) when calling the ``.transform`` method. Such interpolation has shown significant improvements in decoding performances in my recent benchmarks, I thus propose to include it directly in FUGW.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54bd78c33fc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.