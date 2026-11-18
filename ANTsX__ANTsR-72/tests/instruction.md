# Issue

**Title:** New versions of vwnrfs,mrvnrfs, and adding randomMask

## Description

This provides a rewrite of vwnrfs and mrvnrfs to handle individual labelmasks and occupy less memory. All crucial processing is now performed by vwnrfs alone, and mrvnrfs is a wrapper to vwnrfs functionality with no direct processing of images to feed to vwnrfs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74f2c87f3953`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.