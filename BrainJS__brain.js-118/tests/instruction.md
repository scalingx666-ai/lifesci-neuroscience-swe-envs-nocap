# Issue

**Title:** This adds thaw.js

## Description

![A GIF to give the reviewer some spice of the internet](https://vignette.wikia.nocookie.net/tb-org-channel/images/0/04/Thaw.gif/revision/latest?cb=20161103145232)

should solve 

## Makes training async via thaw.js


### Removes `reinforce` option
I felt this cleans up and simplifies the network without changing functionality.

Basically when you train if it doesn't have a set size for the network it initializes and uses your options (as normal) to dictate network size, layers and all

If you have already trained the network or if the network is loaded from JSON then you don't need to set it and it trains as normal.

### Potential PROBLEMS
1) The train options `training callback called with training stats` test fails
    a) I think this is a problem in thaw.js but haven't been able to track it down yet.

2) Should probably have more tests for the new train options

3) With training being async now this may create a new problem with trying to train when currently training.  I haven't tested anything on that I was just thinking and about ramifications of this change.  We might want to add some sort of (is training) variable and if someone tries to train while it's currently training either push this training to the end of current training or escape out with an error or something.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e99124f632d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.