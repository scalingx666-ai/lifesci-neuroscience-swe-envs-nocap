# Issue

**Title:** Add procps to containers to enable nextflow use

## Description

nextflow's container management uses ps to monitor container processes so adding this in to enable it. Minimal impact on the container.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afe323409326`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.