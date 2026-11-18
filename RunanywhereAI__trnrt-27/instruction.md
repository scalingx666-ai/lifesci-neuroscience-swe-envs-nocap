# Issue

**Title:** serve: incremental detokenize for streams, with an end-of-stream self-check; the rank watch alone at 0.25 s

## Description

## What and why

Aman's `colo-detok` work (3 November), ported onto `development`. His four commits keep their authorship; the last commit is the port.

| Change | Why |
|---|---|
| **Incremental detokenize** for streamed responses: the text so far is kept and extended by decoding a window of the newest ids (TGI's prefix and read offsets); the final push decodes the whole output once | `development`'s `_Detok` decodes every id from the first on every push ("the decoding work of a request grows with the square of its length"), on the API's event loop and while holding the GIL the engine thread waits for |
| **An end-of-stream self-check**: each stream checks that what it sent is a prefix of the full decode (all of it without a stop string); a mismatch is logged as a warning, the total at exit | catches a detokenize bug in production without changing what is sent |
| **One cross-thread hand-over per event loop and step**, not one per stream | fewer `call_soon_threadsafe` calls at high concurrency |
| **The rank watch alone, every 0.25 s, failing at first sight**; the loop no longer polls its workers between steps | each poll's `waitpid` released the GIL early in the step's gap; a dead rank now ends an idle or a mid-request engine within 1 s |

**The port** (512a2cd): the self-check's two status lines go through the server's logger (AGENTS.md: library code logs); its tests read `caplog`; lint fixes in the new tests (the ambiguous Unicode in `test_detok_incremental.py` is the test data, so it carries a `noqa` that says so). One behaviour difference needed a test change: `test_a_dead_rank_turns_health_503_and_refuses_new_requests` relied on the loop's own between-steps check, which this change removes; the rank watch starts only above one rank, so the test now runs a two-rank stand-in.

@AmanSwar, worth a look at the rank-watch change in particular: with the between-steps check gone, a one-rank engine has no dead-rank check at all (it has no workers to die), and the watch fails at first sight rather than after 1 s.

## Graphs

- [x] Host-side only: no change under `trnrt/kernels/` or `trnrt/models/`, and no graph shapes change

## Accuracy

Streamed text is unchanged: the incremental decode equals the full decode push by push, including byte-level splits of multi-byte characters and stop strings (`tests/test_detok_incremental.py`), and the final push always decodes the whole output.

## Checklist

- [x] `make check`: pre-commit passes, mypy finds no issues in 101 files, 1,053 passed, 297 skipped, 2 xfailed
- [x] Tests cover the change (`tests/test_detok_incremental.py`, `tests/test_detok_selfcheck.py`, `tests/test_api_engine_health.py`)

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Ports Aman's `colo-detok` work onto `development` to make streamed response decoding incremental instead of re-decoding all ids on every push (previously O(n²) per stream, holding the GIL while the engine thread waits). Each stream now also runs an end-of-stream self-check that verifies the streamed text is a prefix of the full decode, logging mismatches as warnings plus a total at exit; it doesn't change what's sent.

- The incremental decode commits a window only when it extends the committed prefix; an incomplete character at the push boundary is held back and returned with U+FFFD, matching the full decode. Tests bound each push's decoding work to a window.
- The loop no longer polls for dead ranks between steps; the rank-watch thread alone polls every 0.25s and fails at first sight, so a one-rank engine has no dead-rank check.
- Cross-thread delivery per event loop step is batched to one `call_soon_threadsafe` call per loop instead of one per stream, and the self-check logs through the server's logger with `caplog`-based tests; the dead-rank test now runs a two-rank engine.

<sup>Written for commit be708726e340a0c0d977b94cd5c787f126700df5. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/27?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a> <a href="https://www.cubic.dev/action/auto-fix/pr/RunanywhereAI/trnrt/27?returnTo=https%3A%2F%2Fgithub.com%2FRunanywhereAI%2Ftrnrt%2Fpull%2F27&source=description" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"><img alt="Turn on auto-fix" src="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce99615e5b2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.