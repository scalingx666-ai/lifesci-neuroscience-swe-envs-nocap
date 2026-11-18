# Issue

**Title:** fix edge filename computation

## Description

This addresses #363 and seems to do the right thing with local testing.

(scrolling is way less smooth in NeuTu with DVID running this way, wondering if that's something you've seen)

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/367)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0179d8f41f16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.