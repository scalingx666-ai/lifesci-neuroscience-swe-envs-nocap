# Issue

**Title:** Add node between existing nodes on the active skeleton with alt-click

## Description

This adds the ability to <kbd>ALT</kbd>+click in empty space when in skeleton tracing to insert a new node along the edge of the active skeleton nearest the cursor, as requested in acardona/CATMAID#684. Submitted as a PR since this is new functionality and there may be comments about interface or implementation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f19efb8c2f39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.