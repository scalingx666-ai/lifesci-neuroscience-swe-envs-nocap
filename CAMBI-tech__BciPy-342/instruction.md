# Issue

**Title:** Inquiry initialization bug

## Description

# Overview

Fixes bug in inquiry initialization for simulator where the language model was not being used to initialize the first inquiry. Also fixes an issue with the backspace_always_shown parameter not being correctly applied.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f7707745644`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.