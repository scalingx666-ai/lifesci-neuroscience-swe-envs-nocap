# Issue

**Title:** Tinda

## Description

I added the temporal interval network density analysis (TINDA). This analysis is typically done on the state time courses, and looks at the asymmetry of state j occurrence in the first and second half of the interval of state i. 

The analysis includes a way to plot states in a circular fashion, that optimizes the circular flow. I also added two examples: one from a simulated HMM, and one using a previously run HMM on the UK MEG Notts data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46dee049d1f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.