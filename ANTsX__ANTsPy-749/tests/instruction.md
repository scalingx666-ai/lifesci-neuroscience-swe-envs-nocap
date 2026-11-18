# Issue

**Title:** Fix mac wheels

## Description

Attempt to fix build errors by setting `CMAKE_OSX_SYSROOT` dynamically.

Hard-coded paths to `/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk` break the runners, which use XCode rather than the command line tools.

@stnava would you mind testing if this solves your local build problems? Thanks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d8ada112bd7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.