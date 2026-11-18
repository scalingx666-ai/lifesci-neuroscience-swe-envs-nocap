# Issue

**Title:** refactors labelblk blocks interface to return compressed blocks for a…

## Description

I modified the GET blocks test to use the new interface and it passes.  I will test it in more detail when I make the bindings to libdvid.

<!-- Reviewable:start -->

---

This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/144)

<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1d5dd3f9696`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.