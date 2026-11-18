# Issue

**Title:** fix(e2e_workflow): bring the workflow script back under the launch size limit

## Description

Claude Code's Workflow tool refuses a `scriptPath` file larger than 524,288 bytes before any phase runs. It checks the file's size, so bytes, not characters, in every version checked (2.1.177, 2.1.309, 2.1.316 and the current `latest`, 2.1.317). `e2e_workflow.js` on `main` is 524,639 bytes, so every e2e launch fails with `Workflow script file …/e2e_workflow.js exceeds 524288 bytes`. The size test added in #545 counted characters (523,791), so CI stayed green.
- Condense the longest comment blocks in `e2e_workflow.js` (−9,545 bytes, now 515,094). The parsed code is identical to `main`'s.
- `test_workflow_script_size.js` checks each workflow script's byte size and fails 4 KiB under the limit.
Testing: the AST is identical to `main`'s; the size test passes here and fails on `main`; the 23 node steps from `ci-l0-checks.yml` and the pytest files that read `e2e_workflow.js` pass.
This adds the CI check #547 asks for and frees about 5 KB of room.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d2833f8febd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.