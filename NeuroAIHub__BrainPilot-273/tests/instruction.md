# Issue

**Title:** fix(web): ask_user takes over the composer to prevent session hangs

## Description

## Problem
When an agent calls `ask_user`, the `user_input_request` rendered as an inline `AskUserCard` while the main composer stayed fully usable. Users naturally ignored the card and typed into the composer — that message was never routed as the answer, so the agent stayed blocked on the pending request and the session **hung forever** (`RUN_ERROR: Agent is already processing` on every follow-up).

## Solution

### ① Frontend — composer takeover (core)
While an unanswered `user_input_request` exists, the composer is **replaced** by a new `AskUserComposer` (Codex-style picker):
- Numbered options; `↑/↓` to move, number keys `1-9` to jump, `Enter` to submit.
- An **always-present inline free-text row** ("write your own / tell it how to adjust") as the last row.
- **No escape hatch** — the user must pick an option or type an answer; the picker can't be dismissed without answering. This makes "typing into the composer without picking" impossible by layout.
- The stream `AskUserCard` is now a **read-only record** (lists options + resolved answer), so there's a single interaction surface.
- Long/verbose questions are height-capped with internal scroll so they can't push the options off-screen.

### ② Runtime — defense-in-depth fallback
In `session-manager.ts` `sendMessage`, if a `user_input_request` is pending, route the incoming message as the answer to the oldest outstanding request (broadcast the user bubble + `resolveInput`) instead of returning "already processing". Covers old clients / direct API callers.

## Tests
- Web: `AskUserComposer` structure (numbered options, always-on free-text row, no ignore control) + `AskUserCard` record-only. Full web suite green (180).
- Runtime: new "routes an ordinary message as the answer while an ask_user is pending" case. Full runtime suite green (317).
- `tsc -b` clean for web + runtime.

Lands entirely in `@brainpilot/web` + runtime (the cloud gateway is a protocol-agnostic passthrough).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54e2015c08e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.