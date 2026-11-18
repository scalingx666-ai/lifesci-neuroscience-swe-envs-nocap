# Issue

**Title:** Effects Interface

## Description

This adds a pseudo interface making use of internals of Effects.jl

The idea is, that you can run things like
effects(Dict(continuousA=>[1,2,3],categoricalA=>[0,1]),m)

for a model like `0~1+continuousA+continuousB+categoricalA`

and it automatically generates all combinations of the specified variables(in the dict) + replaces the non specified (e.g. `continuousB`) by the 'typical' value, in this case the mean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd8e31c2074a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.