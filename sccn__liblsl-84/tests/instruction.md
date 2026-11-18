# Issue

**Title:** Ensure enums are 4 bytes wide as implicitly assumed in previous versions

## Description

The original issue is in #83. Basically, the API has several enums that were passed as 4 byte wide parameters to functions. The C# bindings assumed the enums were single bytes, but the 3 bytes padding before the next parameter made it (mostly) work on little endian architectures.

This PR prevents the compiler from reserving a single byte for the enums and aborts compilation with a helpful error message (on most modern compilers) or at least an error with a line number and explanation on older compilers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e3d5bcdef16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.