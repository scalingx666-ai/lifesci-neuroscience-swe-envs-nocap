# Issue

**Title:** Set sim seed from network if sim seed not given.

## Description

**Motivation and context:**
Issue #980 hasn't gotten any attention in a while, but apparently the last decision was to implement the behavior as in this PR, i.e. to set the simulator seed from the network seed if no simulator seed is given. Still seems like a good idea to me because today I was again surprised that my network with a process was behaving non-deterministic despite a network seed being set.

.

**Interactions with other PRs:**
none

**How has this been tested?**
added a test

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Bug fix (non-breaking change which fixes an issue)?
- New feature (non-breaking change which adds functionality)?

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44dbaf7dbda7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.