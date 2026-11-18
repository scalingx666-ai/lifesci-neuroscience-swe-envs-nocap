# Issue

**Title:** Use subprocess.run() instead of run()

## Description

Rationale:

1. Silence this LGTM.com alert:
Module '`subprocess`' is imported with both '`import`' and '`import from`'
https://lgtm.com/projects/g/OpenNFT/OpenNFT/snapshot/0d54f6789d902a90e2b8bf13c1252c3b56dba710/files/setup.py?sort=name&dir=ASC&mode=heatmap#xc494989fb6a7d9e7:1

2. Calling both [`subprocess.run()`](https://github.com/OpenNFT/OpenNFT/blob/29bf02cb79477c54b8d6a3c14791c2808a9434c5/setup.py#L120) and [`run()`](https://github.com/OpenNFT/OpenNFT/blob/29bf02cb79477c54b8d6a3c14791c2808a9434c5/setup.py#L143) in the same file is inconsistent.

3. This script also defines `run()` methods in two classes, so use the full name to avoid any confusion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29bf02cb7947`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.