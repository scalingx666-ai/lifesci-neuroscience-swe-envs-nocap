# Issue

**Title:** Preserve exact comparisons in fast permutation entropy

## Description

The fast permutation-entropy path casts values to float64 and adds jitter to break ties. This can erase large integer differences or reorder close floating-point values. Direct comparisons on the original values with positional tie breaking match stable sorting.

The review follow-up explicitly returns NaN for an affected order 3 or 4 epoch before it can produce invalid lookup keys or contaminate another epoch's histogram. Valid epochs are processed separately; self-comparison detects NaN while preserving integer and object-dtype comparisons. Update the bit-key comments to match the comparisons.

All 32 project tests and repository Ruff checks pass. The 2,560 original recorded/transformed feature checks retain their exact result records and agree with the independent stable-sort/counting oracle. In 96 additional recorded batches with explicitly inserted missing samples, invalid epochs now return NaN and all valid neighbours agree with the reference, correcting eight contaminated neighbour values. The two independent PRs also compose locally, with 34 tests and both original workloads passing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfbe68874402`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.