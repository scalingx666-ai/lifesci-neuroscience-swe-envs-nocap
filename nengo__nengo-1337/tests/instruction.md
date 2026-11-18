# Issue

**Title:** No memoize

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->
I was changing the transforms on the connections of `CircularConvolution` in place. This had the effect of not only changing a single instance, but messing with all `CircularConvolution` instances (including future ones). It took me quite a while to figure out what was going on: [The `memoize` property on the input transform](https://github.com/nengo/nengo/blob/master/nengo/networks/circularconvolution.py#L23) caches the matrix to be reused by all circluar convolutions (of given dimension). This PR removes the memoize property from the input transform

This is only relevant in very specific cases, but then again it doesn't seem like the memoize optimization will give a large speed up.

Because `memoize` was only used in one more place where it also doesn't seem very necessary, I removed `memoize` and related code completely in a second commit. It does not make that much sense to keep that code around and maintain if it is not really used and if we ever need it back, it can be retrieved from the VCS/git.

But I'm willing ok with not merging either or both commits if there is some opposition.

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->
nengo_spa needs a similar PR as it copied the circular convolution implementation.

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->
existing tests

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Average (neither quick nor lengthy)


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
- [ ] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b44a1f5d132a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.