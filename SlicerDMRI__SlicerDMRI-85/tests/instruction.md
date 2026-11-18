# Issue

**Title:** Ensure displayable manager are registered with Slicer >= 4.9

## Description

This commit updates the TractographyDisplay module to work with Slicer
following r26540 (BUG: Fix initialization of module displayable managers)

See http://viewvc.slicer.org/viewvc.cgi/Slicer4?view=revision&revision=26540

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb35652c4248`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.