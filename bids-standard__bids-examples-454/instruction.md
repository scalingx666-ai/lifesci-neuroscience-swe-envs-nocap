# Issue

**Title:** fix(7t_trt): Define handedness column to match numeric values

## Description

participants.tsv contains numeric values. The [Edinburgh Handedness Inventory](https://www.physio-pedia.com/Edinburgh_Handedness_Inventory_(EHI)) seems a likely source for these values. In any event, they do not match the BIDS default definition of "right", "left" and "ambidextrous".

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f935685e8fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.