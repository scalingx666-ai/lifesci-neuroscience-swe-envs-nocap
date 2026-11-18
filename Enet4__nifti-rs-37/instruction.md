# Issue

**Title:** Use byteordered

## Description

This PR changes the data encoding and decoding routines to use [`byteordered`](https://docs.rs/byteordered/0.3.1/byteordered/). It is an alternative API with a byte order wrapper, so that reads and writes do not have to explicitly state the expected order in each call, and it also works for an endianness only known at run-time.

This makes the code base a bit cleaner, especially in util.rs since we no longer have to define `Endianness` here, and should also make #34 significantly easier to address. The only breaking change is that now `Endianness` is provided by `byteordered`, which has a few changes in associated functions and variant names (conventional naming: `Little` instead of `LE` and `Big` instead of `BE`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2838d74cc366`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.