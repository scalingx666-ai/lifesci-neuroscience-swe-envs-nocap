# Issue

**Title:** Add directional sensitivity selection

## Description

Introduce leadfield sensitivity to be computed for all directions or per-axis (X/Y/Z).
 Add keyboard handling: when viewing the sum of channels (iChannel==0).
- Compute normLF differently based on iSensitivity (full vector norm or sum of absolute components for the chosen axis).
- Update legend text to reflect the selected sensitivity mode and adjust minor ordering of calls.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f07deef1822`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.