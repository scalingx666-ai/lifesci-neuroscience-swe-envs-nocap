# Issue

**Title:** conda-recipe: Upgrade librdkafka and lz4-c

## Description

It's convenient for me if I can keep these two dependencies in-sync with what my other libraries need.  These are conda-forge's latest versions (`librdkafka 1.4.2` and `lz4-c 1.9.2`).

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/349)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85781464a109`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.