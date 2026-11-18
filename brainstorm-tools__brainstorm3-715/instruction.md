# Issue

**Title:** Fix brainstorm window with gaps for window 11

## Description

reported here: https://neuroimage.usc.edu/forums/t/brainstorm-windows-with-gaps/47010

**BEFORE FIX**
![Screenshot 2024-06-26 173358](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/d916ffae-24a4-4cc5-ab01-e068057a9acd)

**AFTER FIX**
![Screenshot 2024-06-26 173516](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/561c810b-2f20-4de9-a868-1ed5d688572b)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e05b8606518`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.