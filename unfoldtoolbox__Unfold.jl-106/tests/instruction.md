# Issue

**Title:** coerceMissingEventvals

## Description

- additional assertion that MassUnivariate must match data
- fix that previous assertion
- fix2 that previous assertion
- make assertion local to only UfoldModels
- multi event support for mass univaraite mdels
- speed up a test
- oops forgot an times[1]
- potential breaking change, instead of Matrix(formulas) we now have Vector(formulas)
- addiotinal sanity check to provide a better error message and some unittests on missing handling

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93fbf01f2568`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.