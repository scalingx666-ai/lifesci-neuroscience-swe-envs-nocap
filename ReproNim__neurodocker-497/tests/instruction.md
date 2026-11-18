# Issue

**Title:** FIX: skip minification tests on M1/M2 macs and run them otherwise

## Description

This adds back in the minification tests to CI. These tests passed on my Debian Linux machine (intel 64-bit). See  for an explanation of why ptrace does not work on arm macs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52516ea1d1fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.