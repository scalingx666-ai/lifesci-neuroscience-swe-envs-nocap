# Issue

**Title:** fix: default upload cap to 1 GiB; keep FileSidebar errors in layout

## Description

## Summary
- Raise the default `BP_UPLOAD_MAX_BYTES` cap from **20 MiB → 1 GiB** so local deployments match common hosted settings; large PDFs/datasets no longer fail just over 20 MiB.
- Fix FileSidebar layout: upload/list errors were rendered as a sibling grid row and stole the sidebar’s `1fr` track, pushing the session + persistent library trees to the bottom. Errors now sit inside the tree scroll region as a compact dismissible banner with human-readable size text.

## Test plan
- [ ] Local: restart runtime without `BP_UPLOAD_MAX_BYTES`; upload a ~30 MB PDF to 持久库 — should succeed.
- [ ] Local: set `BP_UPLOAD_MAX_BYTES` to a small value (e.g. 8) and upload a larger file — should fail with a readable MB message, and both file tiers stay under the path bar (not shoved down).
- [ ] Dismiss the error banner; trees remain usable.
- [ ] Existing oversize unit tests still pass (`packages/runtime` server oversize cases inject a tiny cap).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4f229e1e9a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.