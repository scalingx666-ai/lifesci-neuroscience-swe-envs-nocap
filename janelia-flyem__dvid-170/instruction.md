# Issue

**Title:** adds some compression options

## Description

I added a '3D' jpeg compression option for raw uint8blk fetch and a google compression (used by neuroglancer) option for a raw 3D labelblk call.  The google compression has been only partially tested.

<!-- Reviewable:start -->

---

This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/170)

<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `38e6c5062b44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.