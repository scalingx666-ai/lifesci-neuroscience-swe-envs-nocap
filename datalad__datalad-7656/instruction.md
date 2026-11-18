# Issue

**Title:** Remove import of GIT_SSH_COMMAND within .consts (import directly from datalad.runner.gitrunner)

## Description

It was added there for compatibility in 24d463109ececaa2e9633daa7445516330f01f73 when moved deeper in hierarchy.

I think it would be best for us to avoid deeper imports in this file and thus to avoid possible circular imports observed in the past. Ref: 

Even though it would "break" external API, I think it is unlikely someone relies on this in extensions (I could be proven wrong), and thus I think it should be ok to release in minor release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3ee97ee17cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.