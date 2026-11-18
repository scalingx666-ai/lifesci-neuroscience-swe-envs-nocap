# Issue

**Title:** Prevent crash when cache shrink fails

## Description

**Motivation and context:**
This prevents from Nengo crashing (exiting with an exception) when the cache shrink fails because of an unavailable lock.

.

**Interactions with other PRs:**
none

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->
Added a test. It needs to access some cache internals which might not be the best style, but it seems to be the easiest way to test it and I don't think the index or lock should be public.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Where should a reviewer start?**
<!--- If the PR warrants it, indicate where a reviewer should start reviewing. -->
<!--- All lengthy PRs and complicated average PRs warrant this section. -->
<!--- If the PR is quick or straightforward, remove this section. -->

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
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c91a2a6a0627`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.