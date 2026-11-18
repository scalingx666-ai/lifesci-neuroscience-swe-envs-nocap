# Issue

**Title:** Replace boost::spsc_queue by a fast SPMC queue

## Description

Please refer to #91 by @chkothe and the discussion there.
This is simply the rebased version from @tstenner and with the latest master merged in.

I happen to have a need to test this so I thought I'd setup the PR too.

@chkothe , I would prefer to not have this PR and instead use only the original PR in #91.  However, I think anything you do to rewrite the history would invalidate the in-line conversations and it would be a shame to lose those. I suppose you could stack on a bunch of `revert` commits, and then add back on the commits from Tristan's fork, but that would create a messy history in liblsl. I don't know of a perfect solution here. I leave it up to you.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60f190c042e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.