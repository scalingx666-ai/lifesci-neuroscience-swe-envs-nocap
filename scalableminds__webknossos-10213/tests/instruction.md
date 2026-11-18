# Issue

**Title:** Make temp path absolute to avoid VaultPath checks

## Description

When the server is started with a relative `java.io.tmpdir`, upload of editable mapping annotations fails because it uses VaultPaths to read zarr from the unpacked zip. Those don’t allow relative paths for security reasons elsewhere.

The fix is to make the tmpdir absolute first.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `287d65234905`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.