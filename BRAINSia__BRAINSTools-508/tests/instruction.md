# Issue

**Title:** STYLE: Swapped copied const-references constructor parameters with pass-by-value parameters that are then moved with `std::move()`.

## Description

Instead of passing construction parameters by reference and then copying to member variables, the parameters are passed by value (therefore copied) and then moved to the member variable.
This is a modernized effect that has the same efficiency.
This implements the modernize-pass-by-value clang-tidy check.
        -"Pass by value and use std::move"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `590c371cecfc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.