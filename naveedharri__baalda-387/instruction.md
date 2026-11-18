# Issue

**Title:** Hotfix: search skips stale plaintext on converted vaults

## Description

Silent hotfix (server only).
- A converted vault keeps its pre-keying plaintext until the null-out; search computed a substring match over all of it (400-500 MB on the largest vaults) for sealed rows whose result it never used, and loaded their stale vectors. Those columns are now read only for plaintext rows. Same results; ~70-90 s AI searches on the two largest encrypted vaults should drop to about a second.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf57acebcb10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.