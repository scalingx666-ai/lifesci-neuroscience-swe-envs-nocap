# Issue

**Title:** REL: v1.10.1

## Description

After a year of small, steady improvements, it is time for a patch release of BIDS. This begins a 1-week review period, with final release scheduled for Sep 3.

Please take time to review the changes to the standard and raise any concerns in this thread.

Please also note that the PRs in https://github.com/bids-standard/bids-specification/milestone/17 may be merged in the upcoming week unless there are objections.

Other PRs should not be merged into master during this period. Minor issues such as typos may be submitted as PRs against this rel/1.10.1 branch so that reviewers can readily see what changed. If a significant error or inconsistency is found, we will delay this release and start a new review period.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `429a1077f9c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.