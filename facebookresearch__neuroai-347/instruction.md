# Issue

**Title:** neuralset: drop the event_types default-check skip

## Description

`_skip_new_event_types` was a migration hack (Jan 2025: explicit `event_types` defaults on all extractors), appended to `exca.base.DEFAULT_CHECK_SKIPS`. Since facebookresearch/exca#174 (Feb 2026) that list is no longer read, so the skip has been a no-op for 9 months. Removing it before exca drops `DEFAULT_CHECK_SKIPS` (facebookresearch/exca#354); otherwise `import neuralset` fails with the next exca release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe31393affab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.