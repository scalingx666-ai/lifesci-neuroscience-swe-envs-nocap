# Issue

**Title:** Fix documentation links

## Description

**Motivation and context:**
@Seanny123 found a broken link in #1421. A bit of grepping revealed a few other broken links. This PR fixes them by using actual Sphinx directives, which we should always use because they would have caught these issues. There is probably also a dead link checker Sphinx extension, but ... meh!

**How has this been tested?**
Built the docs, checked that the links work now.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [na] I have included a changelog entry.
- [na] I have added tests to cover my changes.
- [na] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12d2bb5f0edf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.