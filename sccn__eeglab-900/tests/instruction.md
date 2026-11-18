# Issue

**Title:** Add tf_cycle_calc

## Description

This pull request adds the TF cycle calculator function I suggested in issue #889. Extended description and documentation can be found here now:
https://github.com/widmann/tf_cycle_calc

The changes to pop_newtimef are limited to a push button and the corresponding callback function. No signal processing functions are changed. The problem with respect to the specification of frequencies we discussed were resolved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16567a94d325`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.