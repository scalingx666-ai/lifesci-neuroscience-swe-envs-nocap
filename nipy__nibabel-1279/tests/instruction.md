# Issue

**Title:** TEST: Chdir during doctest to avoid polluting the working dir

## Description

Small cleanup. When running the test suite, `simple.nc` gets dropped into the working directory by the `netcdf` doctests. This detects a doctest in the externals directory and chdirs into a temporary directory to guard us against these, as we'd rather not modify the vendored files more than necessary.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b7ac622c3f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.