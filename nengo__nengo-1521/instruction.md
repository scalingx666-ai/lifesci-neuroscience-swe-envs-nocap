# Issue

**Title:** Use pytest config to specify unsupported tests

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

Currently when backends run the nengo test suite they can mark tests that they don't support through the `Simulator.unsupported` attribute.  This moves that setting to the pytest config file (e.g. `pytest.ini` or `setup.cfg`), instead of it being a Simulator attribute.  This keeps test-specific configuration together in one place, and doesn't clutter the Simulator source code with a large, non-obvious data structure.

We had originally talked about making this backwards compatible, but after thinking about it more I don't think that is necessary.  If backends want to be backwards compatible they will still need to support the `Simulator.unsupported` approach in any case, and if they don't want to be backwards compatible then there is no need to make Nengo backwards compatible.  In any case, I did it in a backwards compatible way so that people can see, and then the fixup commit removes that.

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->

This is based on a commit from  so we can remove it from the history there after this is merged.

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Added a test, and I also created a branch in `nengo-dl` to verify that backends can use this new approach to support Nengo master and Nengo <= 2.8.0.  Can see what that looks like in this commit 

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)=

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Breaking change (fix or feature that causes existing functionality to change)
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7740738a167`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.