# Issue

**Title:** Free disk space when running tests

## Description

Locally I sometimes run into problems where my `/tmp` fills up (I use a ramdisk) when I'm running a lot of tests. This seems like a nice way to make local dev work better for everyone in general, though: remove files created by a test once it passes. I can't think of the last time (or any case where?) I wanted to look at `tmp` files in a passing test. If such a case does arise, it's trivial to work around it using `-o` (see code comment).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a43fb22b9090`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.