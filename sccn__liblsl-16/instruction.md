# Issue

**Title:** Use well defined integer sizes

## Description

This PR changes user facing integer types to have a well defined size, mostly because types like "long" can be either int32 or int64, depending on OS, compiler and target arch pointer size. It also changes buffer sizes to uint32, because 32 bit clients can't handle more than that and we need 64 and 32 bit clients to be compatible to each other.

This breaks the ABI, so we shouldn't merge this for 1.13.

See also:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a0778cbc77a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.