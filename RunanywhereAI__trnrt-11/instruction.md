# Issue

**Title:** Link the repository as RunanywhereAI/trnrt-glm

## Description

The public repository is RunanywhereAI/trnrt-glm. Clone commands, the CI badge, issue and advisory links, the release job's repository check and the package URLs pointed at RunanywhereAI/trnrt, which is not this repository. This changes them to trnrt-glm (and `cd trnrt` to `cd trnrt-glm` after a clone).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3030e4ac479d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.