# Issue

**Title:** BUG: Restore macOS packaged OpenSSL lookup

## Description

Adds the Contents/lib directory to the installed macOS library paths


NOTE: While this makes sense to me, I did not test it myself. I am not set up properly to develop on macOS. @pieper if it's easier for you to fix this issue yourself please feel free to close this PR and open your own. Otherwise would appreciate help testing that this fixes the issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d81bbcfaf52a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.