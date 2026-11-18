# Issue

**Title:** dredge fixes

## Description

Would close #4829

This has two groups of changes:

- Fixes related to the online algorithm: most importantly, a time horizon issue which meant that the current algorithm was processing chunks across boundaries strangely. The first few commits here break these changes up into logical groups.
- Other dredge fixes: biggest one here is adding a log transform to the histogram. Meant to do that a long time ago. Also affects full-mode users, but it is helpful! Should have done this before the benchmark papers @_@

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dc5b605b78a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.