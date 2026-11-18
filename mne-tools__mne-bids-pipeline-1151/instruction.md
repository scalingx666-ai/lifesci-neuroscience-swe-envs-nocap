# Issue

**Title:** Add subject-specific EOG channels with dictionary

## Description

### Before merging …

- [X] Changelog has been updated (`docs/source/dev.md.inc`)


As discussed in #1021, this PR implements the possibility to add subject or session specific EOG channels, similar as done with the ECG-projectors in #1062. I've more or less copied the approach used there, but I don't know if it will work fine as EOG is used in more (?) places / differently than the ECG.

It seems there are not many tests using EOG so I added a short test of this to one of the existing suites. Let me know if this feature should be tested more rigorously

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7929d0c0193e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.