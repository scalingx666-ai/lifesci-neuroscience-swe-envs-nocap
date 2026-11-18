# Issue

**Title:** CircleCI testing fix

## Description

#1190 didn't quite work and now we're getting testing failures on other PR. Some tests were renamed, but we can't figure out how to get github to ignore the older test names. Everything is running fine on CircleCI

Changes proposed in this pull request:

- Rename the new tests to match the names of the old tests
  - Because the old names listed python versions as 310 instead of 3.10, the consistent way to do this was to replace all lists with python versions to just be 9, 10, 11, ... and then add `3` or `3.` as fixed text.
- Also changed the codecov orb to 5.3.0 to see if that fixes the separate codecov problem (It didn't fix that issue, but keeping at 5.3.0)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83cc7f19148a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.