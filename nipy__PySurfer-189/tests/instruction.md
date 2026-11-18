# Issue

**Title:** Use different interface for setting LUT

## Description

There is an inconsistency where the previous method wanted values in [0, 255] while the current method wants values in [0, 1]. I decided to handle this within each method to otherwise maintain prior API.

I generated the docs on my Ubuntu system and everything looks good. It would  be best to have someone else on a different system verify that the example gallery does not change with this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69e969b36983`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.