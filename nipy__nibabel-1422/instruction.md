# Issue

**Title:** ENH: Use appropriate message when reporting TCK `file` attribute error

## Description

Use appropriate message when reporting `file` attribute error in TCK: the previous message was mistakenly reporting the non-existence of the `file` attribute, which indeed has to exist to be able to do the `hdr['file']` without getting a `KeyError`. This patch set uses the message that was not being used when the check was not being successful.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8a175986da0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.