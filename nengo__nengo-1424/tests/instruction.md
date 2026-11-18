# Issue

**Title:** Run codespell through TravisCI

## Description

**Motivation and context:**
In #1413, @luzpaz was kind enough to fix several typos using the `codespell` tool. Rather than let typos keep piling up, this PR runs `codespell` through TravisCI to spot misspelling sooner rather than later.

Note that pylint also has some [spellchecking options](https://docs.pylint.org/en/1.8/technical_reference/features.html#spelling-checker), which I tried out, and did not work well because

- Tons of false positives as variable names are not whitelisted (keeping a whitelist for them would be very time consuming)
- Only checks comments and docstrings
- Requires an additional dependency, `pyenchant`

`codespell`, while requiring a `pip install codespell`, had very few false positives (which I fixed in this PR) and seems to check all text, including variable names and text in Jupyter notebooks. I believe it only looks for a set of common misspellings, but it seems to catch quite a bit, and certainly is better than having nothing.

**How has this been tested?**
Ran this locally with `codespell -q 3`; TravisCI currently testing it.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c0166ad75ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.