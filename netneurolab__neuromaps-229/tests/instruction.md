# Issue

**Title:** [FIX] Update Docker base image to python:3.12-slim-bookworm

## Description

Debian bullseye (base of python:3.9.7-slim) is EOL and its security packages now 404 on the mirrors, breaking the docker-release workflow. Replace libgl1-mesa-glx (removed in bookworm) with libgl1, clean apt lists, and use JSON-form CMD.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07c20fb5cd18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.