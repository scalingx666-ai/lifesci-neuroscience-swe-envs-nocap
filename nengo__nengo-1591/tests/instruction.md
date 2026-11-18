# Issue

**Title:** Change default transform to None

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

This implements the idea described in   Basically, rather than always having an implicit `transform=1` operation on Connections, we just don't apply any transform if none is specified.  In most cases this won't make any difference in the model's behaviour (since `transform=1` wasn't doing anything anyway), but it can save time and memory.

The only situation I can see it being noticeable is if someone was using the default transform and then later on accessing `my_conn.transform`. Previously that would return a `Dense` transform object, now it will return a `NoTransform` object. That seems relatively unlikely (and easy to resolve), but I updated the next version to 3.1.0 for that reason.

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Added a new test in `test_learning_rules` for the new validation checks, and since this is the default transform it is being tested pretty thoroughly in most of the existing tests.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Average (neither quick nor lengthy)

**Where should a reviewer start?**
<!--- If the PR warrants it, indicate where a reviewer should start reviewing. -->
<!--- All lengthy PRs and complicated average PRs warrant this section. -->
<!--- If the PR is quick or straightforward, remove this section. -->

The main implementation change is in `builder/transforms.py`, which uses the new `Null` transform type defined in `transforms.py`. And then there is new validation added for learning rule parameters in `connection.py` to make sure that there are weights for learning to be applied to. Other than that it's relatively minor changes.

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- New feature (non-breaking change which adds functionality)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `715a4f83c2d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.