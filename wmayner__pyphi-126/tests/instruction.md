# Issue

**Title:** Fix purview plotting bug

## Description

Made it so that when plotting purviews with arrange_by_mechanism, if mechanism coords are specified, then plot purviews by those coords

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d9670984778`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.