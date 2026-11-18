# Issue

**Title:** Use conda recipe in the CI build; Remove CMakeLists.txt

## Description

This PR changes the CI setup to build the conda recipe (which includes a `make test` step) instead of the old BuildEM-based cmake build.

I also removed `CMakeLists.txt`, since the CI setup was the last thing that needed it.

BTW: I switched the CI service from Circle-CI to Travis-CI merely because I happen to have recent experience with it.  But either way, the CI setup was due for an overhaul, because it looks like the existing script was using the Circle-CI 1.0 API, which is being [dropped soon](https://circleci.com/sunset1-0).

**Edit**: I also added some minor `Makefile` enhancements.  See commit message.



<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/264)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85a8f5d0497c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.