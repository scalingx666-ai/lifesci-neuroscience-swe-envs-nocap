# Issue

**Title:** ENH: Install cmake using apt

## Description

<!--
Text in these brackets are comments, and won't be visible when you submit your
pull request.

We welcome contributions to ANTs. Pull requests will be reviewed by the
developers and if accepted, become part of ANTs, distributed under the license
terms in COPYING.txt.

Please title your PR according to what it does:
ENH: new or improved functionality
PERF: performance enhancements to existing functionality
BUG: fixing a run time bug
COMP: relating to compilation
DOC: documentation changes
WIP: work in progress, needs further commits to be ready
-->

# Description

<!--
Extended description of your PR.

If the PR can close an existing issue, you can say "" or "". Otherwise you can say something like "Related to #1234".
-->

- In `Dockerfile`, the distro is switched to `debian:bookworm-slim` from `ubuntu:bionic`
- `cmake` is installed from Debian's package repositories, providing a solution which can be more easilly built on linux/arm64
- Use OCI spec annotations e.g. `org.opencontainers.image.title`, see https://github.com/opencontainers/image-spec/blob/main/annotations.md

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1239db92021`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.