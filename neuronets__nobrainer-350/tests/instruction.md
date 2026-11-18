# Issue

**Title:** fix(ci): label-gated release workflow + uv publish

## Description

## Summary

- **release.yml**: No longer fires on every push to master. Now triggers only when a PR with the `release` label is merged. Bumps auto to v11.2.1, actions to v4.
- **publish.yml**: Replaces `pip install build twine` + `twine upload` with `uv build` + `uv publish`. Bumps actions to v4.

## Changes

| Before | After |
|--------|-------|
| `on: push: branches: [master]` | `on: pull_request: types: [closed]` + merged + release label check |
| `actions/checkout@v3` | `actions/checkout@v4` |
| `actions/setup-python@v4` + Python 3.9 | Removed (auto is standalone; uv handles Python) |
| `pip install build twine` + `twine upload` | `uv build` + `uv publish` |
| `auto v11.0.5` | `auto v11.2.1` |

## Security

The `release` label already exists and requires triage permission to add (same as `gpu-test-approved`). External contributors cannot trigger releases.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8e4b4818cf4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.