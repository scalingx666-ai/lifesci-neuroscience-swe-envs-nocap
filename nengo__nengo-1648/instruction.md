# Issue

**Title:** Convolution transpose

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

Transpose convolution is a fairly general way to do different types of upsampling in deep networks. Adding this transform allows many more types of deep networks to be implemented in Nengo, including many types of object detection networks.

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

I added a test that ensures that the `ConvTransposeInc` op is the transpose of `ConvInc`. Since `ConvInc` is tested against the Scipy implementation, if all tests pass then `ConvTransposeInc` (and the underlying code we've borrowed from `np-conv2d`) should be working fine. I've also added tests for the API (mostly piggy-backing off the existing `Convolution` test).

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

Start with the `ConvolutionTranspose` transform, since this is the API (it's fairly similar to the `Convolution` transform). Then, the new test in `builder/tests/test_transforms.py` is the main test that's added to test the underlying implementation. The code in `_vendors/np-conv2d` is copied from [np-conv2d](https://github.com/renmengye/np-conv2d), with the modifications listed in the `conv2d_gradx` docstring.

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

**Still to do:**
<!--- If this is a work in progress, note below what you still plan to do. -->
<!--- Use the task list syntax `- [ ]` so that progress can be tracked. -->

- [x] Changelog entries
- [x] Check that it's showing in the API docs properly

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c7389891af8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.