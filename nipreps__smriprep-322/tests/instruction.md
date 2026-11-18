# Issue

**Title:** ENH: Add cortical ribbon workflow

## Description

#321 has a lot of style changes and some conflicts with master. I tried to pull out the relevant changes into a single commit.

@madisoth could you test this branch? If you're happy with it, you can force-push it to your branch and we can go from there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `188f1d13c362`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.