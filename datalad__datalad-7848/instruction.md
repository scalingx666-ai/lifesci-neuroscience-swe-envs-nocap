# Issue

**Title:** BF: fix AltConstraints.__or__() and Constraints.__and__() mutating operands

## Description

These operators mutated the left-hand operand in-place and returned `self`, causing silent side effects when constraint objects defined at module level (e.g. `reckless_opt`) were reused across multiple `|` or `&` chains.

For example:
    a = EnsureStr() | EnsureNone()  # AltConstraints([Str, None])
    b = a | EnsureInt()             # mutated a! a == b == [Str, None, Int]

Now both operators return a new instance, preserving the original.

This bug was identified in datalad-next's constraint system overhaul (https://github.com/datalad/datalad-next) where the constraint framework was redesigned from scratch.

-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47222ca001d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.