# Issue

**Title:** ENH - also rotate leadfield/filter

## Description

when working with @ZirkZork on duneuro stuff - which in the currently used set of scripts works in a coordsystem that is directed by SIMNIBS - I realized that transform a duneuro computed leadfield to CTF coordinates should also rotate the leadfields. This PR implements this rotation

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47e522c45253`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.