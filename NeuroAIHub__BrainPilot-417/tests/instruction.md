# Issue

**Title:** fix(runtime): normalize Anthropic URLs and surface provider failures

## Description

## Summary
- normalize trailing /v1 only for anthropic-messages providers, including the environment gateway path
- render canonical Runtime retry state as the existing countdown/cancel card in chat
- terminate exhausted provider failures with RUN_ERROR so the normalized provider message remains visible instead of being folded as a recoverable agent diagnostic
- preserve RUN_FINISHED for successful and user-aborted runs

## Validation
- Runtime: 54 files / 528 tests passed
- Web: 57 files / 478 tests passed
- npm run typecheck
- npm run build -w @brainpilot/plugin-sdk
- npm run build -w @brainpilot/web
- git diff --check

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be014a37d8a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.