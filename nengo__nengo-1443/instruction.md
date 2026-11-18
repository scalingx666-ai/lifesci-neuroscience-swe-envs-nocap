# Issue

**Title:** Fix warning for deprecated pytest feature

## Description

**Motivation and context:**
In a recently released version of pytest, we got a bunch of warnings for a [feature that will be removed in pytest 4](https://docs.pytest.org/en/latest/mark.html#updating-code). This PR updates our code to not use the deprecated feature.

**How has this been tested?**
Ran the tests locally, no longer got any warnings.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4d42291f343`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.