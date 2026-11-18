# Issue

**Title:** reduce docker image size + minor improvements

## Description

This PR reduces the Docker image size to 1.42 GB from 2.6 GB. These are uncompressed sizes. Most of these savings are from disabling pip's cache directory. This PR also makes some minor improvements to the Dockerfile.

- use python slim docker images
- use `--no-cache-dir` in `pip install` commands
- replace `MAINTAINER` with `LABEL maintainer= ...` because `MAINTAINER` is deprecated
- use `COPY` instead of `ADD`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d01039fa18d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.