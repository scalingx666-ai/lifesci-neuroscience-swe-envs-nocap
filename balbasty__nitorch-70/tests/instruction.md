# Issue

**Title:** add initial Dockerfile

## Description

This dockerfile builds nitorch and compiles the extensions. The first
stage builds the (compiled) wheel. The second build stage installs that
wheel. The dockerfile bootstraps pytorch's official docker image. The
first stage uses their "devel" image and the second image uses
"runtime".

We should test that nitorch is usable and actually uses the compiled
things. It is possible we will need to update the `LD_LIBRARY_PATH` in
the second build stage.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9867c932b8ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.