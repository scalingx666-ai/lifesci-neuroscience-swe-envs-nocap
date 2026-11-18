# Issue

**Title:** [MRG] fix #581 and fix #620

## Description

-
-

Note that when showing a GUI with a new clustering/shank you need to use `session.show_gui()` to create and load a new GUI rather than `gui.show()` which will try and show the old one with disastrous results...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24e738a3a819`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.