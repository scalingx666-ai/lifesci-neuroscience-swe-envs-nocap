# Issue

**Title:** [MNT] - Update parameter Stepper object

## Description

This tweaks the checks on the Stepper object to allow for using the Stepper object to step along decreasing parameter values.

For example, this would have previously raised an error, but now works:
`exp_stepper = Stepper(2.5, 0.5, -0.25)`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9415bee327ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.