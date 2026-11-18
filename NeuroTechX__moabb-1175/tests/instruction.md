# Issue

**Title:** Fixed behaviour of extra_runs

## Description

Parameter `extra_runs` was effectively dead. Now its intended behaviour has been re-implemented and the value defaulted to False to ensure maximum cross-subject comparability.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f26a09d2fc87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.