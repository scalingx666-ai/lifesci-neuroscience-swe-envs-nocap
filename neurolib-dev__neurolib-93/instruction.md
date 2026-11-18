# Issue

**Title:** Fix: random seed in pypet exploration

## Description

Fix random seed issue for exploration (before, only evolution was fixed):
* If `params["seed"] is None`, value is converted to a string `"None"` before storage to trajectory. 
* When loading parameters during exploration, string check converts it back to `None`.
* Version bump to `v0.5.6`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2825e1ba912d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.