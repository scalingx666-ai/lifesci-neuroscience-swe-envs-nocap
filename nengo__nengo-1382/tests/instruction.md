# Issue

**Title:** Use newer Miniconda on Appveyor to fix failures.

## Description

**Motivation and context:**
One of the Appveyor build jobs was consistently failing because it was using an old (some say ancient: appveyor/ci#1897) Miniconda. I upped the [version numbers](https://www.appveyor.com/docs/build-environment/#miniconda) by using the Miniconda for Python 3.6 to fix the problem.

**Interactions with other PRs:**
none except for making the Appveyor tests useful again

**How has this been tested?**
Pushed the commits and checked that all CI tests pass.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [n/a] I have updated the documentation accordingly.
- [n/a] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [n/a] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46ff75fedc2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.