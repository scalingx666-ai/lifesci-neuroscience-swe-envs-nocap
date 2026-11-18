# Issue

**Title:** State Spectra (Multitaper, Welch) Rescaling

## Description

Changes:
- Previously we binarised the state probabilities before calculating the subject/state-specific spectra. We now avoid this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49e9791965ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.