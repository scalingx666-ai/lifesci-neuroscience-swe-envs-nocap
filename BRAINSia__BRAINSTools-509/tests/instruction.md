# Issue

**Title:** ENH: Changed access level of deleted copy constructors and copy assignment operators.

## Description

By switching the access level from private to public, programmers will be informed that the operation has been deleted
instead of simply being denied access.
This implements the modernize-use-equals-delete clang-tidy check.
	-"Deleted member function should be public"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `590c371cecfc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.