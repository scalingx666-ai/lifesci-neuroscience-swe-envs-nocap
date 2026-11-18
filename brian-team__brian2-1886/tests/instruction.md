# Issue

**Title:** Accept Statements instead of strings

## Description

As a follow-up to PR #1768 (also see discussion in #1219), this changes all the places accepting statements (e.g. resets, `on_pre` in `Synapses`, etc.) to accept `Statements` objects as well as simple strings. This makes the new `Statements` substitution mechanism more straightforward to use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27b5431168cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.