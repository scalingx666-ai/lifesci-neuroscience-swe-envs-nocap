# Issue

**Title:** fix(web): avoid empty Analytics tab when switching conversations

## Description

## Summary

- : opening Agents for a conversation without analytics data no longer lands on an empty Analytics screen inherited from a previous conversation.
- `resolveAgentTabForSession` maps preferred `analytics` → `detail` when edges have no messages (same emptiness rule as `AnalyticsTab`).
- Preferred tab is saved only on user tab clicks (and node/edge selection → detail), not on auto-corrections.
- Within a session, the chosen tab stays stable; Analytics remains manually selectable even when empty.

## Test plan

- [x] `agentPanelTab.test.ts` (empty/rich switch, storage vs auto-detail)
- [x] `tsc -b` for web package
- [ ] Manual: session with traffic on Analytics → switch to empty session → Detail overview
- [ ] Manual: still able to click Analytics on empty session; preference survives for next rich session

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a4b0b246e05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.