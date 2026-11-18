# Issue

**Title:** Bump Python and SPEC0 package minimums

## Description

I noticed we had some `joblib` cruft in our code. This PR removes it. I then had Claude Opus 5 update our deps to SPEC0 mins and remove cruft related to those. I reviewed those changes and they look good.

This one looks pretty simple so I'll self-mark for merge-when-green. There are some optimistic `warnings` eliminations so it might take a few commits to get there! (And I might have to adjust merge reqs since a job name might change.) 

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1eb4a6afdd79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.