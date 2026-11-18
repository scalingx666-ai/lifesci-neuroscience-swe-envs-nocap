# Issue

**Title:** Make native endianness always the default in `NiftiHeader`

## Description

Just making it so that `NiftiHeader::default()` provides
a header with the system's native byte order.

This makes the behaviour consistent with the header builder
(which was already defaulting to `Endianness::native()`)
and favours performance when handling files in the same
machine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f95407fe3a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.