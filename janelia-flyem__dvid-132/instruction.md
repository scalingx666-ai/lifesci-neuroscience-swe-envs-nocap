# Issue

**Title:** Makes gbucket storage plugin more robust to server errors

## Description

I have now successfully tested millions of GETs/PUTs on grayscale and tile datatypes with the gbucket plugin.

<!-- Reviewable:start -->

[<img src="https://reviewable.io/review_button.svg" height="40" alt="Review on Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/132)

<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46e8ea0ffd20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.