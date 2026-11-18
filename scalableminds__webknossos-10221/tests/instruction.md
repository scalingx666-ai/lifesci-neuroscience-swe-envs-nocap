# Issue

**Title:** Avoid raw errors on very long passwords

## Description

#7335 replaced the password hashing library and introduced a subtle behavior change: passwords longer than 72 bytes were previously truncated there, and afterwards were rejected with an exception. This restores the truncate behavior, restoring compatibility with old hashes and preventing exceptions when users try to register with very long passwords.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eef9019aaa3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.