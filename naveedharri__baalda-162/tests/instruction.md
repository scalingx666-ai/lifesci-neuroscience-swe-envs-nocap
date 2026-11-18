# Issue

**Title:** Move attachment transport to the intent flow with Rust streaming and a hash cache

## Description

Stacked on #160 (desktop) and requires the server from #161 (falls back to the legacy POST/GET on a server without it).

`AttachmentSync.pass` now runs `intent → PUT → complete` when the server offers it: a dedupe hit sends zero bytes, single uploads PUT to the returned URL (our own token-authorised route on Postgres, a presign on S3), multipart uploads send 16 MB parts with ETags and re-mint expired part URLs, `upload_incomplete` retries the PUT, 402 aborts the pass with one toast, 413/415 skip that file permanently. Downloads ask `GET /api/blobs/:id/url` and fetch with a clean client, applying the bearer only when the URL is our own route. Intent and URL support are feature-detected per server URL.

Bytes move through Rust: `upload_file`/`download_file` in `attachments.rs` stream from and to disk with `reqwest` (already in the tree via the updater; `redirect::Policy::none()`, no bearer on presigns, hash-as-you-write into a `.tmp` then atomic rename, writes still confined to `attachments/`). `list_attachments` caches `(size, mtime, sha256)` in `attachment_hashes` inside `.context/index.sqlite` and hashes misses with the streamed `sha256_file`, so a vault full of video is no longer re-read on every reconcile; the walk runs outside the index lock.

Desktop vitest 1813 (+13 transport cases), cargo 232 (+6), tsc clean; Cargo.lock adds no new packages. PR 2b (desktop) of the file-formats series.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6f3def51bc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.