# Issue

**Title:** Release 2.7.0

## Description

**Motivation and context:**
This PR fixes a few minor issues that came up when going through the [release steps](https://www.nengo.ai/releasing.html). Some files were not included in the manifest, and some tests had outputs that could be improved.

Since these are minor, probably one review should suffice. I'll merge and do the release once this is reviewed.

If you have any concerns about a 2.7.0 release, this is the PR in which to raise them!

**How has this been tested?**
Looked at output of test plots.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [na] I have updated the documentation accordingly.
- [na] I have included a changelog entry.
- [na] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84a7181a5956`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.