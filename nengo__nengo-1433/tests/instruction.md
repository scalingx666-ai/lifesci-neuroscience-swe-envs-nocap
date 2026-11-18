# Issue

**Title:** Warn if gain, bias override intercepts, max_rates

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->
See issue . This PR adds a warning that occurs whenever an ensemble is built for which specified gains and biases override specified intercepts and/or max_rates. I'm happy to get feedback regarding, for example, whether it makes sense to either issue a warning elsewhere, or add something to the documentation that explains how gains, biases, max_rates, and intercepts are related, and then count on the user not to create ensembles of the sort under consideration here. 

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->
None so far as I know.

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->
I've added a test that checks whether a `UserWarning` is issued whenever an ensemble is built for which gains, biases and at least one of max_rates and intercepts are specified. 

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
The `get_gain_bias` function in `nengo/builder/ensemble.py` has the core change, so it's likely best to start there before moving on to looking at the corresponding test.

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

There's no docstring for the `get_gain_bias` function, and it is likely not something that a user would ever call directly, so I haven't added any documentation. It also seems like a small enough change to avoid including a changelog entry, but I'm happy add this if it makes sense to. 

**Still to do:**
<!--- If this is a work in progress, note below what you still plan to do. -->
<!--- Use the task list syntax `- [ ]` so that progress can be tracked. -->
Nothing at this point.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2583ea0b9800`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.