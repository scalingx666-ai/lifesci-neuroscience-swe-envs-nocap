# Issue

**Title:** Create Actions - rust.yml

## Description

Now that Travis CI has limited free computational use on public repositories, it's high time one had a transition to GitHub Actions.

While I don't believe that we can achieve an equivalent pipeline at this time, this should suffice for now, and more can be added later.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fd41430ea9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.