# Issue

**Title:** Fix the seed_offset option.

## Description

**Motivation and context:**
The pytest `--seed-offset` option was not working because of a typo.

**Interactions with other PRs:**
none

**How has this been tested?**
Tried it out.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [n/a] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6058a518cce3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.