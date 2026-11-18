# Issue

**Title:** gbucket value versioning

## Description

Most of the code change is in gbucket.go.  However, I did also add a very simple set of integration tests in python to help test these changes. 

There are not many changes to the surrounding dvid ecosystem.  I do force storage context to now have  a method to identify the repo that the context belongs to (if it belongs to a repo).

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/228)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bce1ad9ee08f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.