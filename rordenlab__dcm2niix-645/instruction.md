# Issue

**Title:** GE Diffusion JSON update

## Description

- The following keys reported in JSON are limited to GE Diffusion only (#635) :
  - NumberOfDiffusionDirectionGE
  - NumberOfDiffusionT2GE
  - TensorFileNumberGE
  - DiffGradientCyclingGE
- The definition of userData12 (CV12) fro DiffGradientCyclingGE has been updated:
  - userData12 (CV12) = 1 : All-TR
  - userData12 (CV12) = 2: 2-TR
  - userData12 (CV12) = 3: 3-TR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a9fbe82aaf2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.