# Issue

**Title:** Preserve planar contour on ProbeGroup slicing and clarify ambiguous `select_contacts` errors

## Description

Two improvements after #446 is merged:
* probe contours are preserved under slicing.
* Better error for ambigious contact selection when contacts are present in multiple-ids.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c0a3bc473c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.