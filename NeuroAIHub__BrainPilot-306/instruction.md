# Issue

**Title:** feat(web): show upload progress for chat attachments and persistent library

## Description

## Summary

Implements #305: client-side upload progress for chat attachments and the persistent library.

- **`uploadFile`** switches to XHR so `onProgress` can report network send progress; optional `AbortSignal` cancels via `xhr.abort()`.
- Shared **`UploadProgressBar`**: filename, thin bar, percent (or indeterminate), multi-file index, cancel.
- Wired into **PromptComposer** (session attachments) and **FileSidebar** (persistent `/data` library).
- **&lt; 4 MiB**: indeterminate bar (avoids 0→100 flash); **≥ 4 MiB**: percent; after body send: **Processing…** until response completes.
- Cancel aborts the batch without a failure toast; already-successful files are kept (sidebar refreshes when any file completed).
- i18n (zh/en) + unit tests (FakeXHR: base64/raw paths, monotonic progress, abort, backward-compatible no-`onProgress`).

No runtime/cloud protocol changes.

## Test plan

- [x] `packages/web` vitest (`api.test.ts` + full suite) passes
- [ ] Manual: attach small file (&lt;4 MiB) in composer → indeterminate bar → chip on success
- [ ] Manual: attach large file (≥4 MiB) → percent advances; after 100% may show Processing…
- [ ] Manual: cancel mid-upload → no failure banner; prior successes kept
- [ ] Manual: persistent-library upload shows same progress and refreshes tree on success
- [ ] Manual: upload error (e.g. quota) still surfaces readable message

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d345336b39a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.