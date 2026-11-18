# Issue

**Title:** Drop stale RELEASE_PLAN.md reference in image extractor error

## Description

## Summary
- `HuggingFaceImage._get_hidden_states` raises a `RuntimeError` when `hidden_states` is `None`, and the message ends with "See RELEASE_PLAN.md for the tracking item." That file does not exist in the repo, so the pointer dead-ends.
- Drop just the dangling sentence; the rest of the message (regression in `transformers>=5` for CLIP/SAM/ViT encoders) is unchanged.

## Test plan
- [ ] `ruff` / `ruff format` (pre-commit) pass locally.
- [ ] No other references to `RELEASE_PLAN.md` introduced.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06a4d37400c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.