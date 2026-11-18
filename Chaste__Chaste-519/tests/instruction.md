# Issue

**Title:** Update base image for regenerating archive

## Description

@kwabenantim you're definitely the best person to review this PR. Can you check whether this is likely to work, and advise if there's a better solution?

I think the oldest supported boost will always be on an Ubuntu LTS (unless something strange happens), so it will very likely always be possible to use a portability system image for this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99f8a5061faf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.