# Issue

**Title:** Enable automatic builds on Travis (Linux and OS X) and Appveyor (Windows)

## Description

This is initial work to get dcm2niix built on every commit/PR (which should improve quality since we will be able to spot PRs that break compilation before they are merged) and deploy a .zip files when a new tag is pushed.

Things that I managed to get running:
- builds for OS X with batch mode
- builds for Linux with batch mode

Things I could not get to work:
- building for Windows (on Appveyor) - I lack experience compiling C++ code on windows. You can try to get it to work or remove appveyor.yml

Things I did not test:
- Deploying .zips with binaries - this has to be tested after this is merged.

After merging this PR you need to enable this repository on https://travis-ci.org/ and https://ci.appveyor.com as well as generate keys (see comments). Only the repository owner can do this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99bf011380c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.