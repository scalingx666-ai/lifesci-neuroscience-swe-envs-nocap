# Issue

**Title:** [REF] Labels <0 are set to 0

## Description

This will only impact usage of `images.annot_to_gifti()` and `images.relabel_gifti()`, wherein users providing annotation and/or gifti files that have negative labels will find those labels are automatically set to the background value (0). Because, honestly, who uses negative labels? :monocle_face: 

Will try and create tests for the impacted functions (since none exist right now!).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c16e4af457e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.