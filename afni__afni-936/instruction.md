# Issue

**Title:** LiteClue (and xutil) tweaks: added to re-enable hover helps on macOS

## Description

Hover helps stopped working on macOS a few years ago (even though it carries on working on good, ol' Linux OSs).

This branch focuses on updating the code for macOS, and we have to verify that this breaks nothing for Linux.

These updates were derived working with Claude and ChatGPT.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90ce18f64946`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.