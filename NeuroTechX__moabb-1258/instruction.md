# Issue

**Title:** Log auto-filtered datasets at INFO, keep WARNING for explicit ones

## Description

### Log auto-filtered datasets at INFO, keep WARNING for explicit ones (#862)

When datasets=None the evaluation pulls paradigm.datasets and drops the
ones the evaluation cannot run (e.g. single-session for CrossSession).
That is expected, so log at INFO. Datasets the user passed explicitly
still warn when removed. Test added.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f025512ed4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.