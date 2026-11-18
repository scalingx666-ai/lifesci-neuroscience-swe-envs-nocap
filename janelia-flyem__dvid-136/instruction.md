# Issue

**Title:** makes gbucket buffer operation thread safe

## Description

I noticed that in one of my PUT calls  I was calling the gbucket buffer in different threads.  I added a simple lock to prevent contention in a shared data structure.

<!-- Reviewable:start -->

---

This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/136)

<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2687646588fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.