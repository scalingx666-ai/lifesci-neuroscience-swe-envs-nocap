# Issue

**Title:** Robust Modelling

## Description

﻿- added RobustModel Solver via RobustModels.jl
Still waiting for a issue from GLM.jl to make views of X

Todo:
- RobustModels for Deconvolution modelling (not supported for now, even though it is possible as RobustModes.jl implements sparse matrices too! cool!)
- RobustModels for LMM (not supported for now)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd9eba84ad1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.