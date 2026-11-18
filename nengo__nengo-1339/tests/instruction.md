# Issue

**Title:** Update all links to use https

## Description

**Motivation and context:**
`https` is better than `http` for various reasons, so might as well update the links in the code.

**How has this been tested?**
Just documentation changes, but all changed links were manually tested.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0b243f6b5e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.