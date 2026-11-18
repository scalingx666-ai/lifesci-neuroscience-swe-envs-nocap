# Issue

**Title:** TVB-3089 Compatibility with latest numexpr

## Description

`numexpr.evaluate` implementation slightly changed in the latest release 2.8.5.
Here https://github.com/pydata/numexpr/blob/master/numexpr/necompiler.py#L985 is no longer considering the `global_dict` values, just the `local_dict` (2nd positional arg).
Code from the prev release 2.8.4 is here: https://github.com/pydata/numexpr/blob/ec5e90886b021558e51e35870735e7a64500c59e/numexpr/necompiler.py#L819

I propose to leave the call towards `RefBase.evaluate` only in the base `Equation.evaluate` implementation, if possible - like in this PR - for simplicity in fixing future similar API changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `703b503b3f99`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.