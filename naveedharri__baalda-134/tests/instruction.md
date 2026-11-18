# Issue

**Title:** Stop a note doubling one block of its own text

## Description

## What was happening

A customer's `Map of Content.md` reached **16 MB of Yjs state for a 686-byte note** — 1,179,679 lines of 35 distinct ones. The note itself is intact and appears once; one added block ("## Team / ## Personal / ## Reference") is repeated **2^16 times**.

The update log is 18 rows, each ~2× the last, and every one is authored by a **different Yjs clientID** — a fresh `Y.Doc` per cycle. That is `vaultDocStore.coldApply`.

This is **not** the 2026-09-04 seed-vs-pull race. That one duplicates the whole note from two interleaved versions; this duplicates only the delta and leaves the rest untouched.

## The mechanism

`coldApply` opens a transient bridge for a background note, hydrates it from the local CRDT store, folds in the `.md`, applies the server's update, egests. Folding the file in first is a genuine three-way merge and has to stay one — reordering it loses a teammate's edit (tested, backed out). But ingest turns file bytes into ops attributed to *this* client, so when the file already held the text of the update about to be applied — what a local store that has fallen behind its own file looks like — that text was inserted twice, once as fresh local ops and once as the server's. Yjs keeps both. The egest wrote the doubled text back, so the next update doubled twice as much. 276 bytes → 8 MB in seventeen steps.

## The fix

- **`isExternalEdit`** — exact, not heuristic: ask what the update *alone* would make the text; if the file already says that, the file is this loop's own echo, not an edit worth ingesting.
- **`NoteBridge.drainIngest`** — three more doors of the same family: passes now serialise (two overlapping ones each applied their own copy), the diff is recomputed after the recovery snapshot's `await`, and a whole-file insert into a doc still waiting for its first pull is refused.
- **`whenPersisted()`** — persistence was fire-and-forget and `destroy()` synchronous, so a torn-down bridge left the local store behind its own file. That is the state the loop feeds on; cold apply and LRU retire now await it.
- **`noteSizeRefusal`** — the ceiling capped each message, so every update in the cascade passed under a 10 MB cap that produced a 16 MB note. It now also refuses writes to a doc already over the cap, making the limit a wall rather than a step size.

## Tests

`coldApplyDoubling.test.ts` (3) and `doubling-ingest.test.ts` (3) all fail on the unfixed code; the cold-apply pin fails with "expected 2 to be 1". Desktop 1370 passed, server 610 passed.

## Note on existing damage

Not repaired here, by decision. One consequence to be aware of: notes already over the cap (the customer's 16 MB one) will now be refused by the sync server on every connect — openable locally, but not syncing until someone runs the existing `POST /api/notes/:id/reset-crdt`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6d3d7052ba5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.