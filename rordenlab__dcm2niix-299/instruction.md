# Issue

**Title:** Bruker 4D dataset slice ordering / file grouping

## Description

- Bruker 4D datasets: Fix parametric maps grouping

  Fix incorrect combining of parametric maps into one Nifti file (#282)

- Bruker 4D datasets: correct slice ordering

  Use Dimension Index Sequence (0020,9222) to identify elements of
Dimension Index Values (0020,9157) and re-order them such that In-Stack
Position Number (0020,9057) is always first, and hence slices are
correctly grouped together.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bde92bf35fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.