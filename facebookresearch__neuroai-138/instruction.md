# Issue

**Title:** Adjust duration calculation to account for precision

## Description

## What does this PR do?

Small fix for decimal precision in `EnsureTexts` `EventsTransform` to be sure that all the `Word` events are enclosed in the newly created `Text` events.
Reused the same approach as in `_extract_sentences` in `utils`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `656d8513b585`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.