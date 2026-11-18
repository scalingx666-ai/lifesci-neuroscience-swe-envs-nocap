# Issue

**Title:** Fix bugs with Piecewise process output shape

## Description

**Motivation and context:**
This fixes two related bugs with the Piecewise process:

1. `Piecewise({1: [1, 1, 1]})` would return `0.0` for times < 1 (rather than `[0, 0, 0]`).
2. `Piecewise({1: 1})` would return an array with shape `()` for times < 1 and shape `(1,)` for times >= 1, 
    because `ravel` upsizes its inputs to at least 1d.  This doesn't really produce any errors, but it's 
    probably good to be consistent.  I thought about adding some logic to check if the output shape 
    should be `()` or `(1,)`, but then figured that it was probably easier/more consistent to just always have 
    the output of the process be an array, instead of a scalar.

I wasn't sure whether to add a changelog entry or not.  Technically a bugfix, but it comes so closely on the heels of the feature release that it seems unnecessary (anyone looking at the changelog would probably be seeing both things for the first time).

**How has this been tested?**

Added a new test, see `test_shape_out`

**How long should this take to review?**

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
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1547f8d3478e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.