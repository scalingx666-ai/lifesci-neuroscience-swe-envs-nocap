# Issue

**Title:** Adds vertical scroll bar to the training widget

## Description

This copies the code used for the detection widget to add a scroll bar to the training widget (allowing it to be used on small screens).

The curation widget doesn't use magicgui, so the solution can't be copy & pasted. Considering the widget is much smaller though, I don't think it needs a scroll bar.

Also adds a missing dependency

Closes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c38399a34deb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.