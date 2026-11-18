# Issue

**Title:** Use Compression::fast

## Description

We wondered for a long time why our writer was much slower than NiBabel. Turns out that `Compression::default()` is not

1. fast at all
2) what NiBabel [does](http://nipy.org/nibabel/reference/nibabel.openers.html). It's misleading. It looks like they use 9 (slowest) but their default is actually 1 (fastest).

With that change, we are as fast and even faster than NiBabel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c796543aa206`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.