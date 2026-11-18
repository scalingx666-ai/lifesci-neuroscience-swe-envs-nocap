# Issue

**Title:** Use Either type to reduce object impl redundancy

## Description

This makes a significant improvement in the maintainability of the `object` module.
By including the `either` crate, we obtain a sum type for data which may be conditionally GZip encoded, that still implements `Read`.

Minor caveat: this now uses the `Either` type for reading the volume's data, even for in-memory volumes. This should hopefully not introduce a noticeable overhead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26eab021db97`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.