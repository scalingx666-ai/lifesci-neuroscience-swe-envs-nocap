# Issue

**Title:** WIP: Build from an R base image

## Description

Replaces the old Ubuntu docker file with one based on the rocker project image. This has R pre-installed and avoids having to deal with installing custom keys. It makes it easier to get a specific R version and have some dependencies (eg, devtools) pre-installed.

This is a WIP, it builds with minimal dependencies

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9df124acffbd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.