# Issue

**Title:** Update connectivity.py to fix documentation of coherence_magnitude()

## Description

Fix typo in coherence_magnitude() in connectivity.py. Originally, the file said that the modulus squared of coherency was not the magnitude squared coherence. However, I believe that's the definition (i.e., drop the complex component and normalize the real component to be bounded by 0 and 1). Provided citation as well for clarity, so folks can see the simplified equation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `548a1b975f31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.