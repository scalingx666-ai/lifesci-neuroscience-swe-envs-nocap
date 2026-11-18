# Issue

**Title:** Fix bad-mcs-classmethod-argument warnings.

## Description

**Motivation and context:**
This is minor, but ensure consistent naming.

**Interactions with other PRs:**
Cherry picked from #1278 for easier review.

**How has this been tested?**
Added check to pylintrc, ran it, gave warnings, cherry picked the fix, ran pylint again, it succeeded.

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
- [n/a] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d13ffececbae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.