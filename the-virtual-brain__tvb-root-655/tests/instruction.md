# Issue

**Title:** TVB-3076: Improve logs for PhasePlane web page

## Description

- [x] turn off  `TRACE_USER` logging for `fill_default_attributes` controller method in `Burst` area
- [x] disable logs for `docutils.publish_parts` calls (we were having many and lengthy warnings in case the docstring on some `Model.dfun` methods is invalid)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4dc5a824ff21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.