# Issue

**Title:** REL: 1.11.2

## Description

Over the past 6 months we worked on the BIDS study specification and came to an agreement. We would like to publish this update in a patch release of BIDS. 

This begins a 1-week review period, with final release scheduled for Sep 28.

Issue #2449 needs to be resolved before this patch release, since it is related to PR #2416 which is included in this release. Pinging current contributors to this issue for notification: @bendhouseart @coalsont @pmolfese @melanieganz @effigies 

Other PRs should not be merged into master during this period. Minor issues such as typos may be submitted as PRs against this rel-1.11.2 branch so that reviewers can readily see what changed. If a significant error or inconsistency is found, we will delay this release and start a new review period.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7e4c332c077`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.