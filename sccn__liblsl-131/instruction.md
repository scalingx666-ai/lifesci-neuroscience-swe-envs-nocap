# Issue

**Title:** Remove Ubuntu 16.04, migrate Ubuntu 18.04 to docker builds.

## Description

Binaries produced by the preinstalled toolchain depend on `libgcc_s1` which isn't in the default repositories (many thanks to @tobiasherzke for the detailed explanation in #129).

This PR adds a config field `docker` that, when set, runs all steps in this container. For Ubuntu 18.04 builds, it selects the `ubuntu-latest` build image and then runs the rest of the build in the `ubuntu:18.04` docker container. This is less flexible than @tobiasherzke's approach, but requires only minimal changes to the CI config and is ~4x faster.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f941ed5bdcbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.