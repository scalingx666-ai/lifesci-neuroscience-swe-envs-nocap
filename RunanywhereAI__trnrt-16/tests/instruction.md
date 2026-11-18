# Issue

**Title:** router: a non-streaming client that disconnects aborts its request on the worker

## Description

## What and why

A non-streaming request sent through the router keeps generating on the engine after its client disconnects. The engine's own API aborts a request whose client goes away (`serve/api.py`). But the router holds its own connection to the engine open until the full response arrives, so the engine never sees the disconnect. It decodes to `max_tokens` and keeps a decode seat the whole time.

With this change the router races the upstream call against `request.is_disconnected()`, and closes the upstream connection when the client leaves. The engine then aborts the request the same way it does for a direct client. Streaming requests already behaved this way.

## Graphs

- [x] Host-side only: no change under `trnrt/kernels/` or `trnrt/models/`, and no graph shape changes
- [ ] Changes compiled graphs: which ones, and the `tools/graph_equiv.py` or device evidence

Only `trnrt/serve/router.py` changes.

## Accuracy

No output changes for requests whose client stays connected. The existing router and serve tests pass unchanged.

## Performance

Capacity, not speed. In the new test (CPU, a stub engine that decodes for ~6 s), the client disconnects at 1 s:
- before: the engine ran to the end (~6 s);
- after: the engine sees the disconnect at ~1.0 s, the same as the control request sent straight to the engine.

## Checklist

- [x] `make check` passes (lint, type-check and the CPU suite)
- [x] Tests cover the change: `tests/test_router.py::test_a_plain_client_that_disconnects_from_the_router_aborts_its_request_on_the_worker`, which fails on `main`
- [x] Docs updated (README, `docs/`, `CHANGELOG.md`)

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Fixes non-streaming requests that continued generating on the engine after their client disconnected from the router.

The router kept its own connection to the engine open until the full response arrived, so the engine never saw the disconnect and decoded to `max_tokens`, holding a decode seat. Now the router races the upstream call against the client's disconnect and closes the upstream connection when the client leaves; the engine aborts the request as it does for a direct client. Streaming requests already behaved this way. Output is unchanged for clients that stay connected.

<sup>Written for commit bf177875bc474edd9a6f94bd5820b7ce93d38327. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/16?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c58bd113fdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.