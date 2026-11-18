# Issue

**Title:** FIX: Repair FreeSurfer Dependency in Dockerfile (tcsh)

## Description

FreeSurfer's `recon-all` requires `tcsh`, but that shell was no longer being added in the Dockerfile. This installs it.

The lack of `tcsh` escaped testing during CI because `recon-all` had been skipped entirely (generally too expensive to run). This change also removes `stats/wmparc.stats` from the FreeSurfer derivatives for ds005, which ensures that at least some of the `recon-all` scripts are run (any dependencies that are only used in earlier stages would still be missed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b0dcdbcb2b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.