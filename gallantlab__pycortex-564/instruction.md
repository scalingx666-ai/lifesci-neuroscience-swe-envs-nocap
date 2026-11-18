# Issue

**Title:** Python 3.13 compatibility, and upgrade to Cython 3

## Description

It managed to compile on Python 3.12 and 3.13 and run through the tests, but I haven't checked if the webviewer still works yet.

This should fix #563 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff58a7e03a57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.