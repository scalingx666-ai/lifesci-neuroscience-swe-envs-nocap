# Issue

**Title:** feat(memory): time-bound profile facts expire from the recap

## Description

## Problem
Profile facts never expire. A time-bound fact like "exams this weekend" stays in `_meta/profile.md` and gets injected into every new session by the SessionStart recap until someone runs `forget` by hand.

## Change
- `memory profile set KEY VALUE --until YYYY-MM-DD`: after that date the fact drops out of `memory recap`. The row stays in the table, shown as expired in `profile list`, until it is forgotten.
- New optional `Until` column. Profiles written before it existed parse unchanged.
- `until` works through the Python client (`remember(..., until=)`), the MCP `memory_profile` tool, and `POST /v1/memory/profile`.
- `wiki-capture` tells agents to record time-bound facts with `--until`. `docs/cli.md` and `docs/memory.md` updated.

## Tests
- New: `test_recap_drops_a_time_bound_fact_once_it_is_over` covers expiry, a future date still showing, and rejection of a malformed `--until`.
- Full suite: 1204 passed, 5 skipped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `356fe0c8b03b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.