# Issue

**Title:** Fix checkbox inconsistency: label [ ] -> [ ] label

## Description

This commit fixes some checkboxes that had their label to the left to add some consistency.

While at it, I also added label tags, so the labels can be clicked to (de)activate their checkboxes/radios.

Checkboxes concerned:
"Display reference lines" in Navigator
"RGB slices" in crop tool
4 checkboxes in classification editor

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a127927fe402`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.