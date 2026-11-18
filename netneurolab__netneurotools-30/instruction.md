# Issue

**Title:** [ENH] Adds cluster submodule

## Description

With some fun new functions for working with different clustering partitions! 

Also includes some light refactoring of `nntools.modularity` to use the new `find_consensus()` function.

**To do:**
- [x] Finish writing tests for `match_assignments()`, `reorder_assignments()`, and `find_consensus()`
- [x] Add some examples! These are functions that really need context to showcase their utility, so adding some Sphinx gallery-type example docs would be _awesome_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8caedb710b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.