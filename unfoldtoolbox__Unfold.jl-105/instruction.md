# Issue

**Title:** multiEventMassUnivariate

## Description

finally we can do
Dict(:A=>(f1,times),:B=>(f2,times))

for mass univariate models :

- additional assertion that MassUnivariate must match data
- fix that previous assertion
- fix2 that previous assertion
- make assertion local to only UfoldModels
- multi event support for mass univaraite mdels
- speed up a test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93fbf01f2568`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.