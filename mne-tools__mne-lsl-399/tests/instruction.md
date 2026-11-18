# Issue

**Title:** Fix for annotation with no duration

## Description

Instead of building a separate mechanism special casing entirely annotations streams with annotations that don't have a duration, let's just encode the value -1 on the annotation vector pushed to the stream outlet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77501ad907f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.