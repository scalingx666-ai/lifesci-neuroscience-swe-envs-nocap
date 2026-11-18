# Issue

**Title:** BUG:  Fix image processing and registration inconsistencies.

## Description

- Preserve labels during morphology and honor single-label selections
- Correct patch bounds, centering, and reconstruction
- Binarize masks using all nonzero values
- Honor SyN metric parameters and current deterministic settings
- Respect target masks and preserve background in joint label fusion
- Avoid mutating input image lists during random transformations
- Add regression tests organized by functionality

Addresses discrepancies identified in ANTsX/ANTsR#455.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c113f8f7e9a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.