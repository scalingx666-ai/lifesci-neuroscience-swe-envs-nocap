# Issue

**Title:** Wrapped non-overloaded functions in extern C to prevent name-mangling.

## Description

I'm working on a C# wrapper and it's annoying to have to lookup the mangled entry point for every function I'm trying to wrap. This prevents the names from being mangled.

The libs and testcbsdk still build and run in Windows but I haven't tested this any further than that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85d756fb9963`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.