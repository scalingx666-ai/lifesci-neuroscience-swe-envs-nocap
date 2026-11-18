# Issue

**Title:** ENH: Replaced instances of the `throw()` specifier with `noexcept` or removed them entirely.

## Description

The throw specifier from C++ 11 is now considered to be poorly implemented and can be indeterministic.
The specifier `noexcept` is a modernized version that solves earlier pitfalls.
However, it does not include an option to permit specific exceptions.
Thus, empty `throw()` specifiers have been replaced with `noexcept` and
non-empty `throw(...)` specifiers were removed.
This implements the modernize-use-noexcept clang-tidy check.
	-"Dynamic exception specification 'throw()' is deprecated; consider using 'noexcept' instead"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `590c371cecfc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.