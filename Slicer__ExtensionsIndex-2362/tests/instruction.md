# Issue

**Title:** MorphoDepot: pin Slicer 5.10 stable to the 5.10 branch

## Description

Points the **Slicer 5.10** MorphoDepot catalog entry at SlicerMorphoDepot's new `5.10` branch (frozen from current `main`) instead of tracking `main`.

**Why:** the upstream repo is about to advance `main` with a substantial feature line; pinning 5.10 stable to a dedicated `5.10` branch keeps the released version fixed while `main` moves forward for Slicer Preview. Only the `5.10` index branch is affected; `main` (Preview) is untouched.

Also updates `scm_url` from the pre-transfer `MorphoCloud/SlicerMorphoDepot.git` (worked only via GitHub redirect) to the canonical `SlicerMorph/SlicerMorphoDepot.git`.

The `5.10` branch exists: https://github.com/SlicerMorph/SlicerMorphoDepot/tree/5.10

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c9009f55715`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.