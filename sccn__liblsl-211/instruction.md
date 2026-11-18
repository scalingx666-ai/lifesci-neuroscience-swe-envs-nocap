# Issue

**Title:** Fix buffer size calculation in resolve_streams

## Description

Fix buffer size calculation in resolve_streams and resolve_stream functions.
`sizeof(buffer)` returns the byte size of buffer, not the number of elements it contains. This should be modified to `sizeof(buffer) / sizeof(lsl_streaminfo)`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a85d6f96916`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.