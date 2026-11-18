# Issue

**Title:** [DATALAD RUNCMD] Use ubuntu-22.04 until we fixup NeuroDebian APT for recent debian/ubuntu

## Description

otherwise -- our CI is very red now

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e2dfecec8c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.