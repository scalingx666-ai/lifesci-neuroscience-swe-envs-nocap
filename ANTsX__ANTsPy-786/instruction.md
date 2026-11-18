# Issue

**Title:** CI: Build all the wheels weekly

## Description

We now have quite a lot of wheels to build.

Switch to building on python=3.13 nightly, and build others only weekly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c9c38b9bff0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.