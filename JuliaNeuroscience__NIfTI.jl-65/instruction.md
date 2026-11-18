# Issue

**Title:** Update Project.toml

## Description

Add compat for MappedArrays v0.4

At the moment, other packages are blocked from updating when NIfTI is a dependency (e.g. HistogramThresholds.jl)

A quick test on my machine had no problems with MappedArrays 0.4

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab0c38024a1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.