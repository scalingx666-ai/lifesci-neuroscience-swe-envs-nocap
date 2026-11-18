# Issue

**Title:** add logging to t2smap

## Description

.

Changes proposed in this pull request:

- The LGR logger in `t2smap_workflow` is now initialized with the same style of log file name as `tedana_workflow`
- The integration test for `t2smap` was not using `check_integration_outputs` and replicated a bunch of the code there. Added a param to that function to check for a log function that begins with `t2smap_` instead of `tedana_` and edited `test_integration_t2smap` to now use that to check the file registry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94bd77ee5ac5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.