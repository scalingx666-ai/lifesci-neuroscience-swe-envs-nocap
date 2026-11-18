# Issue

**Title:** Feature/tf records

## Description

A new way of constructing datasets using TFRecords.

- This is much more efficient in terms of GPU memory especially when training on large datasets.
- This also provides a way to shuffle data better on large datasets.

Potential improvment:

- The writing of TFRecords files to the disc can take some time (~3mins for 612 subjects in CamCAN). Might be good to parallelise this.

This  .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `950d026b0fe1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.