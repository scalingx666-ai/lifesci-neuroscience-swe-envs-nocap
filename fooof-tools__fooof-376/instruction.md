# Issue

**Title:** [ENH] - Add triangle periodic fit mode

## Description

This adds a new "triangle" periodic fit mode. 

Implementation notes:
- The currently defined 'triangle' is a symmetric triangle or sawtooth shape
- It's defined to match the parameters of the gaussian (CF, PW, BW)

Usage notes:
- However, there appear to be some quirks with using this in the existing fitting mode (e.g. bandwidth guesses don't seem great) such that it doesn't seem to end up on ideal solutions
- Currently, this mode should be considered experimental

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d7f7b64a4a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.