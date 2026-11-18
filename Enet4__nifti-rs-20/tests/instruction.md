# Issue

**Title:** Optimize `into_img_file_gz` to reuse PathBuf

## Description

Just a tiny improvement to the function that translates a header file path to the respective volume file. I noticed it because Clippy would warn about `path` being passed by value without ever being consumed. I actually intended to use the same `PathBuf` by just redefining the base name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7db333654041`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.