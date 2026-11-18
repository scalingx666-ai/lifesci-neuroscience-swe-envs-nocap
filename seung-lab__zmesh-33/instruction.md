# Issue

**Title:** perf: use robin_hood flat hash map to improve simplification

## Description

Test with slow example on M1:

New code: 16:40 (1000s) to process
Old code: 23:36 (1416s)

1.42x speedup

Test of connectomics.npy:

New code: 488.26s user (8:43 total, 523s)
Old Code: 678.19s user 16.93s system (11:44.37 total, 704s)

1.34x speedup.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `067a379c8793`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.