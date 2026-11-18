# Issue

**Title:** tui - fix crashing selection modal

## Description

With the latest Textual 7.5 version, in some cases modals need minimal dimensions  before rendering and fix textual breaking change BLANK->NULL.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b112657be2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.