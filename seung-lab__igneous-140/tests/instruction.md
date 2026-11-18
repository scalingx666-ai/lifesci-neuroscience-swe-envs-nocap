# Issue

**Title:** feat: add encoding level to transfer tasks

## Description

Adds `--encoding-level` to `igneous image xfer` which allows you to control jpeg quality, png level, and fpzip precision. This gets added to the info file as `jpeg_quality`, `png_level`, and `fpzip_precision` on the indicated scale. All other scales will continue to use defaults unless the correct parameter is present.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c42ca8a5fbec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.