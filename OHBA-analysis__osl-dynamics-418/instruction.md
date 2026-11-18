# Issue

**Title:** mat7.3 support + low-density AAL parcellation

## Description

Changes:
- Added support for loading mat7.3 files.
- Updated conda environments (to include the `mat73` python package).
- Added a low-density (24 ROI) AAL parcellation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00586ad078f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.