# Issue

**Title:** Fixed incorrect parsing of arguments, removed unused import.

## Description

Changed references to argparse namespace object to match the new CLI args.
Changed import of 'icv' to pull from samseg, not gems
Removed unused imports

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b0a84f4e6f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.