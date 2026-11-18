# Issue

**Title:** Implement change root dir

## Description

Implements the features mentioned here: 

usage: `aa_change_root('path/to/old/dir','path/to/new/dir','analysisid')`

where the first two parameters are the new and old `aap.acq_details.root` and the third parameter is `aap.directory_conventions.analysisid`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4e3f733d889`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.