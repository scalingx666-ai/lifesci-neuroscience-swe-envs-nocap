# Issue

**Title:** BUG: Stop segmentation fault when Atropos is multi-threaded

## Description

Partial fix for #1627.

@ntustison, I tried replacing the local interpolator with a vector of interpolators for each bin at the class level. It improves the performance issue. I initialize the interpolators in the `SetInputListSample` function, which I think will cause them to stay up to date with respect to the m_HistogramImages, but I'm not sure.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1dc2956b9f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.