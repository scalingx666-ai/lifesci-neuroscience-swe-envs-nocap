# Issue

**Title:** Index lists with double references using negative indices

## Description

**Motivation and context:**
There is one special case with sliced indexing that still does not correctly work: If a list of indices references the same index twice, but once with a positive integer and once with a negative integer, one of those will overwrite the other one when the slicing is done on an input. This PR fixes that by converting all indices to positive indices (as a canonical representation) before checking for repeated indices.

**Interactions with other PRs:**
none

**How has this been tested?**
added a test

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Average (neither quick nor lengthy)

**Where should a reviewer start?**
I'd recommend going commit by commit, but the PR is small enough that looking at the full diff should work too.

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
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d568ffcd8dae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.