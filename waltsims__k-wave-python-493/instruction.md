# Issue

**Title:** Update environment variable generation for safer execution

## Description

As mentioned in #484, execution safety and reliability could be improved. We merged a patch fix in #489, but this updated logic adds the required environment variables separately to the subprocess and removes the need for `shell=True`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b48de1305c26`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.