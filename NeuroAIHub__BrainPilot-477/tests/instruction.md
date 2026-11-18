# Issue

**Title:** fix(runtime): preserve paused tasks and escalate nested failures

## Description

## Summary
- keep tasks durably queued when their target agent's delivery is paused and report  without attempting a wake
- preserve normal immediate delivery for active targets and existing resume-on-user-input behavior
- notify exact task creators on terminal delivery failure and also send one compact nested-failure escalation to Principal
- cap provider error text included in escalation notifications

## Verification
- targeted runtime regression suite: 58 passed
- runtime typecheck passed
- full runtime suite: 659/660 passed; the remaining existing temp-directory cleanup race passed in isolation
- git diff check passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ef4efe1825e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.