# Issue

**Title:** make splitting of label on "-" optional

## Description

The default remains the same, but by making it more generic and moving it to the end of the function, it now also works for BIDS datasets where the channels.tsv contains the labels with "-xxxx" extension. 

This .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82112af3c568`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.