# Issue

**Title:** Add Google Analytics ID to docs

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

Adds Google Analytics ID to the documentation (made available in the latest `nengo-sphinx-theme` release).

I didn't bump the minimum `nengo-sphinx-theme` version because someone could still use an older version if they wanted for some reason (it just wouldn't do anything with the analytics id).  But we could also just bump it 🤷‍♂ .

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Confirmed manually that we're getting data form the new `nengo-sphinx-theme`.

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
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db89a56f8c95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.