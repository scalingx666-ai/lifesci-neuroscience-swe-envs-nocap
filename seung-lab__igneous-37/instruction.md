# Issue

**Title:** refactor(Dockerfile): Reduce Docker image size

## Description

Reducing docker image size by
* only adding files to the Docker image that are actually required (no caches and eggs)
* removing build dependencies that are never used, or already installed
* removing requirements that are never imported in igneous itself
* collapsing the RUN layers to a single one (otherwise the cleanup is useless)
* removing libboost-dev after building the meshing library
* prevent pip from caching installation files
* removing some additional temporary/cached files from the installed site-packages

We could probably save quite some additional space if we switch to `python-slim` or even alpine... not sure how heavily others rely on the current images additional tools

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb30b47e391d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.