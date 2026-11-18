# Issue

**Title:** Fix attachment sync crashing in the real app: timer receiver and missing rustls provider

## Description

Found while testing the merged file-formats series locally: dropping a PDF registered its `files` row and created the pending blob, but the bytes never moved.

1. `AttachmentSync` stored `setTimeout`/`clearTimeout` as fields and called them as methods; WebKit throws `Can only call Window.setTimeout on instances of Window`, killing every reconcile and text pass. Node and jsdom don't enforce the receiver, so tests passed. The defaults are now wrapped closures.
2. The Rust transport built its `reqwest` client with `rustls-no-provider` (matching the updater) and nothing installed a crypto provider, so the first upload panicked with "No rustls crypto provider is configured". `ring` was already in the tree via hyper-rustls; it is now a direct dependency (same version, no duplicate) and installed once beside the client. A cargo test now actually builds the client.
3. Error bodies were clamped with `String::truncate`, which panics mid-character; replaced with a char-boundary clamp and tested with multibyte bodies.

Verified in the running dev app: the pending blob flipped to `ready` after the rebuild. cargo 238 passed; desktop vitest 48 attachment/tree-binary cases passed; tsc clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6dcaf3d7983`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.