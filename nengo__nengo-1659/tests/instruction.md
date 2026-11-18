# Issue

**Title:** Fix test_pytest_nengo.py to work with new pytest

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

`test_pytest_nengo.test_unsupported` is breaking with new pytest (6.2.1), since we can't overwrite `tmpdir` anymore.

Also increase minimum pytest to 3.9.1 (which has `tmp_path`).

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

- Ran modified test with pytest 6.2.1, and it works. Also double-checked that file is moved properly.
- Ran all tests with pytest 3.9.1, and they all pass.

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

- [ ] I have read the **CONTRIBUTING.rst** document.
- [ ] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [ ] I have added tests to cover my changes.
- [ ] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55b5c4f7da35`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.