# Issue

**Title:** Adds Dockerfile to build dvid image

## Description

Adds the Dockerfile that can be used to create a docker image for dvid eg:

docker build --build-arg CONSOLE_VERSION=3.4.10 --build-arg
DVID_VERSION=0.9.8 . -t dvid:0.9.8-3.4.10

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/350)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb4620e65a3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.