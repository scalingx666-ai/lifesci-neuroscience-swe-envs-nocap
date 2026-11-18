# Issue

**Title:** ENH: Update build Qt6 macOS script to Qt 6.11.2

## Description

Qt 6.11.2 was released on August 18th 2026. See https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.2/release-note.md

I used this to build Qt 6.11.2 successfully for arm64 macOS.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `891751aef18c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.