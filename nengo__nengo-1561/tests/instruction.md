# Issue

**Title:** Change point at which neurons achieve max_rates

## Description

The new `NeuronType._max_x` controls the point at which neurons
achieve their max rates. By moving this point above 1 (which it
was before), ensembles that use intercepts in (-1, 1) will no
longer have arbitrarily large gains as intercepts approach 1.

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

Addresses #1534.

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Will post plots below.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Breaking change (fix or feature that causes existing functionality to change)

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

**TODO**
- [ ] Fix `Ensemble.max_rates` documentation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a625a153eda6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.