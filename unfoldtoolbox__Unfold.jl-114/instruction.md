# Issue

**Title:** Add io functions

## Description

I added Bene's `save` and `load` functions for Unfold models and wrote corresponding tests.

In general, the functions work, however, for a continuous time model with two events the designmatrix reconstruction in the `load` function yields two matrices instead of one. This still needs to be fixed.
(see https://github.com/unfoldtoolbox/Unfold.jl/blob/e863d909660bc403a06e8035c3618a8b1ec5e237/test/io.jl#LL38C65-L38C65)

The other broken test (for test set 2) is about using the `effects` function for a UnfoldLinearMixedModel, which is not currently possible ( #113).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7eaaa5530640`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.