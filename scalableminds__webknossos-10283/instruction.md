# Issue

**Title:** Exclude JNI build from CI cache to avoid CMake path mismatches

## Description

If the github runner changes exact installed java version the CMakeCache paths from the cache are wrong. I had several failing CIs. Excluding the JNI build from the cache fixes this permanently. The JNI build is very fast anyway.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01b9c45d6133`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.