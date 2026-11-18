# Issue

**Title:** Template other files with nengo-bones

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

nengo/nengo-bones#17 adds additional file templating. Here we make use of this. 

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->

Depends on nengo/nengo-bones#17.

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Visually compared the changes in the generated files to their originals to make sure they were equivalent.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [ ] I have read the **CONTRIBUTING.rst** document.
- [ ] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [ ] I have added tests to cover my changes.
- [ ] I have run the test suite locally and all tests passed.

**Still to do:**
<!--- If this is a work in progress, note below what you still plan to do. -->
<!--- Use the task list syntax `- [ ]` so that progress can be tracked. -->

- [ ] Finish and merge nengo/nengo-bones#17.
- [ ] Make sure this is using the newest nengo-bones.
- [ ] What about the `__copyright__` in `__init__.py`?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3bb962e3d891`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.