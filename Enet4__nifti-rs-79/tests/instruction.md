# Issue

**Title:** Add ndarray_volumes as a default Cargo feature

## Description

Truth be told, this crate is particularly useful when combined with ndarray,
there are way more use cases which require it than not.
So I say it's time to promote this feature as enabled by default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abefc896d53e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.