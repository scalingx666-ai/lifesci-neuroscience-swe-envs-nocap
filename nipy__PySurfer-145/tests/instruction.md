# Issue

**Title:** Ffmpeg

## Description

Two small issues:
- ffmpeg says “Please use -b:a or -b:v, -b is ambiguous”
- Even with this, ffmpeg seems to print to stderr instead of stdout (on my setup), so logging an error seems wrong

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22d55dfe3ff9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.