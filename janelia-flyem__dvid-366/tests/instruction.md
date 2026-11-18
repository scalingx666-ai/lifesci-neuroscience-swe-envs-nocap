# Issue

**Title:** preliminary s3 support (and precomputed doc)

## Description

This diff adds preliminary support for s3:// URIs with the existing precomputed support in DVID.
It also adds a readme to tell people how the (currently-implemented) precomputed support works.

I have not done end-to-end testing of this (because of #363) but this is at progress towards what we want (after 363 is resolved I may need to make some smaller changes to make things actually work, once better testing is possible). Via email, it was suggested that some parts of the precomputed design might change along with 363 being fixed.

If it would be better to hold off on doing a PR until other code changes settle down I can do that.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/366)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `213f7888784c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.