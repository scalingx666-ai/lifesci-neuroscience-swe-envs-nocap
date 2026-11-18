# Issue

**Title:** Install SciPy when building docs

## Description

**Motivation and context:**
At the moment, a lot of our more complex notebooks ([e.g.](https://www.nengo.ai/nengo/examples/associative_memory.html)) render with a warning because SciPy isn't installed when building this docs. This PR installs SciPy when building the docs through TravisCI.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [na] I have updated the documentation accordingly.
- [na] I have included a changelog entry.
- [na] I have added tests to cover my changes.
- [na] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a07c535cbee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.