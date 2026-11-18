# Issue

**Title:** Changed all Variables to volatile for evaluation

## Description

This change drastically reduces memory consumption while evaluating a network.

**Update**: This seems to fix another bug, which I had not yet reported. Before the change evaluation would be slower than expected (for example: 1000 samples train would take 100s, 100 sample evaluation would take **more** than 10s even though this is a much less computationally intensive part.
After this commit the same network will evaluate a lot faster!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00a41b05d43b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.