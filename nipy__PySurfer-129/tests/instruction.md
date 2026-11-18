# Issue

**Title:** ENH Brain:  allow time_label to be function

## Description

This should solve the problem of displaying time in ms while representing it in seconds (which is assumed by `Brain.save_movie()` when determining time dilation). To display in ms use `time_label=lambda x: '%s ms' % int(round(x))`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a7b40975a960`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.