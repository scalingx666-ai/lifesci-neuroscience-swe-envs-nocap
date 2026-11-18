# Issue

**Title:** Add store_artifacts steps to integration test jobs

## Description

## Summary
- Adds `store_artifacts` steps to the three-echo, four-echo, five-echo, reclassify, and t2smap CircleCI jobs
- Makes integration test outputs visible in the CircleCI Artifacts tab for debugging purposes
- Artifacts are stored at `/tmp/src/.testing_data_cache/outputs/<test-name>`

## Test plan
- [x] Verify CircleCI builds complete successfully
- [x] Check that the Artifacts tab shows test outputs for each integration test job

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f66cb0fc7da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.