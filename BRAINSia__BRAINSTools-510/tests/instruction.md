# Issue

**Title:** STYLE: Replaced default bodies of special member functions with `- default;`

## Description

The explicitly defaulted function declarations enable more opportunities in optimization,
because the compiler might treat explicitly defaulted functions as trivial.
This implements the modernize-use-equals-default clang-tidy check.
	-"Use '= default' to define a trivial destructor"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `590c371cecfc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.