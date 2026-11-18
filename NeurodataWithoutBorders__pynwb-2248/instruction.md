# Issue

**Title:** Accept num_samples in OpticalSeries, OnePhotonSeries, and TwoPhotonSeries

## Description

.

`OpticalSeries`, `OnePhotonSeries`, and `TwoPhotonSeries` build their docvals by enumerating the inherited `ImageSeries` arguments by name, and `num_samples` was not added to those lists when it was introduced in #2194. Since `ImageSeries.__init__` raises when `format='external'` and `rate` is used for timing without `num_samples`, the three types were impossible to construct in that configuration.

Adds `num_samples` to the three argument lists, plus construction and roundtrip tests for each type. All three new unit tests and all six new roundtrip tests fail without the source change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `724908381143`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.