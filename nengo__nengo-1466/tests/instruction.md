# Issue

**Title:** Test deselection

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->
This shows them in the deselected count, but keeps them separate from
test expected to fail or being skipped. The slow tests are still being
skipped because to me these still belong into the tests of selected
tests that should run for a full pass of the test suite whereas the
other categories are more special cases (for example tests that only
plot things, but do not assert anything).

This commit also adds messages detailing what has been selected right
after the collection.

Supersedes #1350, .

This does not count how many tests have been deselected in each category. To me this seems to be not worth the effort (because those number have to be stored awkwardly when the deselection is done to be able to print them when the report created).

I added a commit inverting the logic of `noexamples` (i.e. a value `True` meaning the no examples should be run) that makes more sense to me and I was initially confused by the existing logic. But that commit could be dropped from the PR.

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->
Supersedes #1350

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->
manually trying out different flags to pytest

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Average (neither quick nor lengthy)

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
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83d359f012ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.