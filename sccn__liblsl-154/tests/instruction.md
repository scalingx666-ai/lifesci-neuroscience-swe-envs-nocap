# Issue

**Title:** Fix accidental protocol downgrade

## Description

The size of `std::string` is implementation-defined but not relevant for protocol version 110. A size mismatch is therefore not a reason to downgrade the data protocol to 100.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `055a1bd85014`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.