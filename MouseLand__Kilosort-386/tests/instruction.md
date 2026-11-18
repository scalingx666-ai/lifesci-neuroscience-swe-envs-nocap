# Issue

**Title:** Add git tracking to rez.ops using ops flag [ops.useGit]

## Description

- tracks kilosort repo by default
- [rez.ops.git.kilosort] contains all info to fully recover state of kilosort repo (incl. local changes!) based on any sorted [rez] output data structure
- allows for tracking of additional user repos (e.g. lab-specific kilosort config, data preprocessing/conversion, utilities, etc)
- see ./utils/gitStatus.m for implementation, recovery example, and how to add your own repos

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74c64485d8dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.