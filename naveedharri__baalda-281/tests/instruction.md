# Issue

**Title:** Time out stalled registry listings and show repeated pull failures

## Description

New local notes could stop registering on the server without any visible sign, while edits to existing notes kept syncing over their own connections.

**Problem.**
- Registry pulls run one after another. The folder and note listings a pull fetches had no timeout, and `request()` stopped its timer once headers arrived. One stalled listing could therefore hold every later pull, and with it all new-note registration, indefinitely.
- A failing pull was only logged to the console. Nothing showed in Health or on the pill.

**Fix (desktop only).**
- Registry listings time out after 2 minutes per page. `request()` keeps the timeout running while the body is read. Only callers that already pass `timeoutMs` are affected; bootstrap pages and blob transfers are not. A timed-out pull fails and the next trigger starts fresh.
- Consecutive pull failures are counted. After 3 in a row, or a streak older than 5 minutes, Health shows "New notes and folder changes aren't syncing" with the last error, and the pill reads "Sync incomplete". The streak clears on the next successful pull or a vault switch.
- These don't count as pull failures: offline, signed-out (401) and update-required (426), which each have their own prompt.

Tests: desktop vitest 2781 passed / 12 skipped, tsc clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3b4ed82cdee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.