# Issue

**Title:** ParameterSpace used by exploration and evolution

## Description

- `ParameterSpace` can be initialised with either a parameter dict or a list of names and a list of values.
- `ParameterSpace` does better validity checks of the parameter space.
- Auto detection the kind of space (point, bound, grid) and set `.kind` attribute
- Both, evolution and exploration use the same class now (before, exploration would use a `dict`, had to be changed minimally)

Todo:
* [x] implement tests since coverage dropped by 0.07% :'(

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1a6c0dbd316`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.