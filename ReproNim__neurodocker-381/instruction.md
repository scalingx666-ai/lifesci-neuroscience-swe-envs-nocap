# Issue

**Title:** Parameratizing git remote for source builds

## Description

@kaczmarj, for your consideration:

This parameterizes references to git remotes.

At some point, I'd love to get FreeSurfer building from source in neurodocker, and this would be very handy for a development workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77bacb160e46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.