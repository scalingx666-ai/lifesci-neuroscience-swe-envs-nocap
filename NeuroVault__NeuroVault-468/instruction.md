# Issue

**Title:** Update docker compose to version 2

## Description

This solves problems with runnig redis on never docker-compose installs. @erramuzpe thumbnails were not generated probably because redis server did not run properly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbfaa50a8a23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.