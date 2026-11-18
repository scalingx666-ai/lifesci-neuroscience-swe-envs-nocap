# Issue

**Title:** Set origin of submodules to be same as parent repo

## Description

-- Set origin of submodules to be same as parent repo to follow paradigm of submodules and parent repo being one code
-- Fix submodule download in setpaths without git not working because setpaths options are not parsed correctly.
-- Clean up and remove obsolete files

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5938cc8d7b91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.