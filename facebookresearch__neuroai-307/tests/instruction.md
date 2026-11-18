# Issue

**Title:** neuraltrain: DistributedClipLoss accepts different batch sizes across…

## Description

… ranks

Ranks may now hold different batch sizes: each rank's slice is padded to the largest for the gather and trimmed back, in forward and backward. Each rank still needs as many candidates as estimates, checked on all ranks at once so a mismatch raises everywhere rather than hanging.

Lets grouped batches (one subject per batch, short trailing batches) train under DDP without `drop_last`. The distributed test now also runs an uneven 2 + 4 split against single-process `ClipLoss`.

The rank-based retrieval metrics (`Rank`, `TopkAcc`, `TopkAccFromScores`, `InverseNormalizedRank`) keep their per-batch states as lists, concatenated at `compute()`, so they also sync when ranks scored different numbers of queries.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f80987f6340`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.