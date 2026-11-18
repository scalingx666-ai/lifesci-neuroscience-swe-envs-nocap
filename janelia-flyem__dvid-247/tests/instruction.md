# Issue

**Title:** Small makefile tweaks

## Description

Just some minor improvements to the Makefile output messages. Gives a more descriptive error message if a conda environment isn't active.  Also, displays the default backend if none was specified.

(This is a PR onto `stuart-trial`.)

**Edit:** I also added the Memory Profiling section to `GUIDE.md`, and deleted the old developer instructions from the wiki.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/247)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa4f86f81dc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.