# Issue

**Title:** [ENH] - Add and use `group_to_dict` function

## Description

Add `group_to_dict` function to `data.conversions`. 

The allows for exporting group results to a dictionary representation, which can then be used as a faster way to go from group results -> dataframe.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcb5d6f017c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.