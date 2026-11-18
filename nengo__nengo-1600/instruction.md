# Issue

**Title:** Use autosummary renaming to simplify docs

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

Uses the new `autoautosummary`/`automodule` renaming functionality in `nengo-sphinx-theme` to simplify the documentation (avoids having to manually add each object to the documentation).

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->

Depends on  and 

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Built the docs locally and confirmed they looked the same as before (other than a few things being slightly re-ordered).

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
- [n/a] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2aac8ef89ba8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.