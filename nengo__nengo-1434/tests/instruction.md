# Issue

**Title:** Build docs with -v flag

## Description

**Motivation and context:**
Chris noticed that our Nengo core docs were still at 2.6 even though we did a 2.7 release. Turns out the [doc build timed out](https://travis-ci.org/nengo/nengo/jobs/350350669). It's non-trivial to speed up the notebook rendering, so as a quick hack to fix this, I added the `-v` flag to the Sphinx build, which increases the amount of output it produces. TravisCI uses shell output to figure out if the build has stalled, so it should make it so that it doesn't time out.

**How has this been tested?**
I first pushed this without the `-n "$TRAVIS_TAG` check for doc building and [it passed](https://travis-ci.org/nengo/nengo/jobs/373554009).

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb9cafc9afe3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.