# Issue

**Title:** Adding dependabot settings to provide cooldown periods

## Description

dependabot provides useful information about updates to packages that we might apply to dev branch (and manually cherry-pick to release branch for critical fixes)

BUT if supply chain has been compromised, with a malicious release of an upstream package, that can sometimes take a few days to be detected and resolved. It's safest to have a cooldown period and only install packages that have remained on PyPI for longer than that cooldown (meaning they were released for several days without being noticed as fake and pulled)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8412d775f97e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.