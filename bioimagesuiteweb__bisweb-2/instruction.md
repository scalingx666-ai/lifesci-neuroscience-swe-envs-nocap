# Issue

**Title:** Zach

## Description

The fixes to bisweb_fileserver client and a bit of what I've been working on for an AWS selector modal before I realized that accessing public buckets from our application would be problematic. I managed to replicate the bug that creates a scan line in the 2mm image but not the 1mm one. Not entirely sure what that's about but I'll submit another PR if I figure it out over the weekend.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9dba03856943`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.