# Issue

**Title:** Add 'side' option to randomization tests

## Description

This adds a `side` (possible values: `two-tailed`, `right`, `left`) option to be passed to `p_from_null` in the ISC randomization tests for determining whether the p-value output is one- or two-tailed (based on conversations with @me-sh). Previously, `two-tailed` was hardcoded into the randomization tests. I've also set the default to `right`, since effectively all ISC analyses are seeking positive correlation (and negative correlations are pretty nonsensical in ISC analysis).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76148929c1ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.