# Issue

**Title:** Make conda install quiet as workaround

## Description

**Motivation and context:**
As noted in #1392, TravisCI has started crashing during conda installs. After consulting  this seems to be caused by writing too much output. This is resolved by quietly installing `conda`.

**Note**: One of the recommended workarounds is setting `.travisci` to `filter_secret: false`, however this didn't work. ):

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb735b817be4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.