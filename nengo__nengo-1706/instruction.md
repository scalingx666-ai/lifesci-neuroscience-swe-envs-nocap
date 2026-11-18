# Issue

**Title:** Fixing RandomizedSVD behaviour in absence of scikit-learn installation + pkg_resources test fix

## Description

**Motivation and context:**
- Nengo throws and error when trying to use RandomizedSVD without scikit-learn installed
- Broad testing suite fails to run due to pkg_resources deprecation

**Interactions with other PRs:**
- None to my knowledge

**How has this been tested?**
- Ran RandomizedSVD unit test with and without sciki-learn installation, no failures
- Ran broader testing suite and no more testing errors

**How long should this take to review?**
- Quick

**Types of changes:**
- Wrapped scikit-learn with try/except. Throws a warning for an absent install and defaults to SVD.
- Replaced pkg_resources with importlib

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes (N/A)
- [x] I have run the test suite locally and all (relevant) tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d28cb91484ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.