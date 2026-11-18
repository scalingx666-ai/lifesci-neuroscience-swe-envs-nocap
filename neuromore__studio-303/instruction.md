# Issue

**Title:** Tweaks for OpenBCI with Daisy

## Description

**Tweaks for OpenBCI with Daisy**
* Changes channel names to numeric `1-16` numbers like on OpenBCI alone
* Sets large timeout like on OpenBCI alone (fixes device getting removed before fully connect)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e5a4df692be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.