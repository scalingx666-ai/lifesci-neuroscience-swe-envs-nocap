# Issue

**Title:** Add a tvb_library Pipfile

## Description

This adds Pipfile for the tvb_library to improve the library setup process for development purposes with pipenv, addressing the issue of divergent requirements.txt, Dockerfiles, and CI build scripts (or maybe I'm not up to date on the latest?).  I don't think it's smart to merge changes to every CI script at once, so I just want to get the Pipfile in there first, start using it a bit, and later change the Dockerfile/CI scripts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `113da1013d10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.