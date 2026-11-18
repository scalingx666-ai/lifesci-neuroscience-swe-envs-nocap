# Issue

**Title:** WIP ENH: add MeanDiffusivity to scalar maps CLI

## Description

I figured out what the problem was last time I worked on this (values not matching trace/3) -- the enum range is clamped in vtkDiffusionTensorMathematics. That code really needs to be refactored because using a giant switch is error prone, but for now I'm convinced it's correct.

Needs test here which I'll add before merging.

Pending merge of

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45eceb180590`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.