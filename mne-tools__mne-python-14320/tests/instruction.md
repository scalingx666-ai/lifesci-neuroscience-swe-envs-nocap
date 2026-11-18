# Issue

**Title:** FIX: Restore bads when interpolate_bridged_electrodes raises for bad_limit

## Description

While reviewing #14287, I noticed that `interpolate_bridged_electrodes` clears `inst.info["bads"]` before checking bad_limit. If too many electrodes are bridged together, the `RuntimeError` is raised before the original bads are restored. The user's bad-channel list is silently lost.

### This PR:

- Moves the lines that save and clear `info["bads"]` to after the `bad_limit` check. Nothing before that point uses `info["bads"]`, so behaviour is otherwise unchanged.
- Extends the existing `bad_limit` part of `test_interpolate_bridged_electrodes` to mark a channel as bad and assert it is still marked bad after the error is raised. The new assertion fails on `main` and passes with this change.

AI disclosure: 
Claude Opus 5 was used to help with formatting this PR and the changelog entry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c166d8c191d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.