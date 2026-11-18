# Issue

**Title:** router: walk the prefix trees for a sessionless request in a worker thread, off the event loop

## Description

## What and why

For a request with no `session_id`, the router matches and inserts the request text in each worker's prefix tree (`PrefixTree.match` / `insert`). Both walk the text one character at a time in Python, on the router's single event loop, which also relays every token of every stream on the box. Coding agents that send no session id (OpenCode, for example) send their whole growing history every turn, so the stall grows with the context:

| request text | `pick()` on the event loop |
|---|---|
| 0.14 MB | ~35 ms |
| 0.46 MB | ~122 ms |
| 1.1 MB (~250K tokens) | ~300 ms |

(CPU, measured with `Router.pick` on realistic chat histories.)

This change keeps the routing decision on the event loop and moves the two tree walks, plus the `json.dumps` of the messages, into worker threads (`Router.pick_off_loop`):
- An `asyncio.Lock` keeps requests in arrival order from match to insert, so the decisions equal `pick()`'s, request for request.
- A `threading.Lock` guards the trees.
- Session requests touch no tree and are picked at once, as before.

## Graphs

- [x] Host-side only: no change under `trnrt/kernels/` or `trnrt/models/`, and no graph shape changes
- [ ] Changes compiled graphs: which ones, and the `tools/graph_equiv.py` or device evidence

## Accuracy

Routing is unchanged. `test_pick_off_loop_routes_as_pick_does` drives 300 random sessionless requests through both `pick` and `pick_off_loop` and requires identical worker choices.

## Performance

Longest event-loop stall for one 1.1 MB sessionless request: ~300 ms before, ~12 ms after (CPU). Tree walks are still serialized and hold the GIL, so other coroutines get time slices rather than true parallelism. A page-hash prefix match, like the engine's `page_chain`, would remove the per-character cost entirely, but it would change routing decisions, so it is left out here.

## Checklist

- [x] `make check` passes (lint, type-check and the CPU suite)
- [x] Tests cover the change: `test_pick_off_loop_routes_as_pick_does`, and `test_the_prefix_trees_are_walked_off_the_event_loop` (fails on `main`)
- [x] Docs updated (README, `docs/`, `CHANGELOG.md`)

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
The router now walks the prefix trees for a sessionless request in worker threads instead of on its event loop, which relays every stream on the box. Matching and inserting the request text (plus the `json.dumps` of its messages) stalled the loop for ~300 ms on a 1.1 MB (~250K-token) request; now the stall is ~12 ms.

Routing decisions are unchanged: an `asyncio.Lock` preserves arrival order from match to insert, a `threading.Lock` guards the trees, and session requests are picked at once as before.

<sup>Written for commit 7dccc956b2ec796a3f994e07618aea30b7d6e991. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/17?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

<!-- coderabbit-ai-generated:v1 -->

## Summary by CodeRabbit

* **Bug Fixes**
  * Large sessionless chat requests now cause substantially less event-loop delay during routing. For a 1.1 MB request, the reported delay fell from about 300 ms to about 12 ms.
  * Streaming and non-streaming requests continue to use the same routing decisions. Session-based requests also continue to be routed directly without prefix-tree matching.

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0099165d612`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.