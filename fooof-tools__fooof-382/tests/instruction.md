# Issue

**Title:** [ENH] - Add formula to Mode

## Description

This adds a `formula` attribute to the Mode object, so that a Mode definition can store a latex version of the mathematical formula that is fit. 

Related / additional edits done here:
- Writes out the formulas for each implementation in `specparam/modes/funcs`
- Updates the naming of the aperiodic fit functions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32a28a8c3bca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.