# Issue

**Title:** Mcr missing deb libxp6

## Description

This deb file 

http://mirrors.kernel.org/debian/pool/main/libx/libxp/libxp6_1.0.2-2_amd64.deb

doesn't exist anymore and currently the build of a recipe fails because of it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5dbe50e28312`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.