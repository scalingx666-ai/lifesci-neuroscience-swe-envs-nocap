# Issue

**Title:** Fix progress bar in Jupyter Lab.

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->
The JavaScript renderer has a higher precedence than the vDOM renderer.
Thus the updates of VdomOrHtmlProgressBar were executing the JS updates
and not the vDOM updates in recent Jupyter Lab versions. By sending the
JavaScript embeded in HTML, the same renderers will be used for the
update as for the initial display which ensures consistency no matter
which renderer has precedence. (But the HTML renderer also has a lower
precedence than the vDOM renderer.)

.

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->
none

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->
Manually in Jupyter Lab and Jupyter Notebook.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c27d26c9b206`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.