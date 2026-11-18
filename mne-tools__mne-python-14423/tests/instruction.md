# Issue

**Title:** fix for neo 0.14.6

## Description

Fix for error's showing up in #14413 . python-neo changed the way they handle recording gaps to raise by default, and introduced a new parameter [gap_tolerance_ms](https://github.com/NeuralEnsemble/python-neo/neo/rawio/neuralynxrawio/neuralynxrawio.py#L94-L100)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ab5922ca55d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.