# Issue

**Title:** Cython: declare pointers one per line

## Description

None of these declarations was incorrect, but Cython now warns about them. The developers are worried that people will write “`cdef int* a, b`” and think that “`b`” is an “`int*`” rather than an “`int`”. Reducing the number of warnings from Cython makes it easier to notice warnings that might represent real problems.

See also https://groups.google.com/g/cython-users/c/MA8I1wmoT0Q for discussion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5e063b09d09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.