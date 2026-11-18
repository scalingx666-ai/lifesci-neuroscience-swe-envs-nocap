# Issue

**Title:** Fix the example batch config to match defaults

## Description

With this change, people who copy/paste the example batch configuration YAML will get the default behaviour. This could have saved me a lot of debugging :-)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23d087566a22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.