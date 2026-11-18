# Issue

**Title:** FIX,REF Handle different header length for vox2ras tk

## Description

A simple fix for all these issues is to just take the last for lines, as @jwparks suggested.
While I was there, I also refactored the code to make it a bit more modular by extracting the function to call vox2ras-tkr.
This was manually tested by running `cortex.align.automatic`. Unfortunately, the test cannot be easily added to our unit tests because we would need freesurfer. (This makes me sad.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `629cea5372de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.