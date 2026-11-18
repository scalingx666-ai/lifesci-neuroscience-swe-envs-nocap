# Issue

**Title:** improves job queueing system; reduces lock timer; improves GC hack

## Description

This commit passes my local tests but I want Stuart to test for big ingestion.  I am not trying to fix the apparent garbage collection issue yet.  I improved the queueing system but I still need to further refactor ... presumably getting rid of the bufferable ops interface at some point will help clean it up.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/232)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f12af3e0b2ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.