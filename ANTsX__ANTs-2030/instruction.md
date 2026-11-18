# Issue

**Title:** CI: Replace retired macos-14 runner with macos-15

## Description

GitHub retires the `macos-14` runner image on **2026-11-02**. Before that date, jobs on `macos-14` fail during scheduled brownouts (October 5-6, 12-13, 16-17, 19-20, 23-24, 26-27 and 29-31, 14:00-00:00 UTC), and queue times can increase.

Changelog: https://github.blog/changelog/2026-10-01-github-actions-macos-14-runner-image-retirement/

This PR replaces `macos-14` with `macos-15`, one of the recommended arm64 replacements. The job stays on Apple Silicon.

Notes:
- The release asset name comes from `matrix.config.os`. The arm64 macOS asset changes from `ants-<ver>-macos-14-ARM64-clang.zip` to `ants-<ver>-macos-15-ARM64-clang.zip`. I also renamed the job from `Macos-14-clang` to `Macos-15-clang`.
- The workflow does not set `CMAKE_OSX_DEPLOYMENT_TARGET`. Thus the arm64 binaries will probably need macOS 15 or later (before, macOS 14). If you want to keep support for macOS 14, add `-DCMAKE_OSX_DEPLOYMENT_TARGET=14.0` (or lower) to the configure step. I did not make that change in this PR.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01JHfNi68jSqSr942sTJHYj6

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f65b0e66bea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.