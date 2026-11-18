# Issue

**Title:** Clean documentation and readme

## Description

- Clean up documentation blocks
   - escape square brackets when they are not supposed to be links
   - code formatting for certain identifiers and mathematical expressions
   - fix an intra-link in the streamed module
- Update readme to use `ReaderOptions` instead of deprecated functions.
  This is pretty much the reason why I stick to very short examples in the readme file, if any.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abefc896d53e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.