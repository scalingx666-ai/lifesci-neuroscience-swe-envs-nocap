# Issue

**Title:** [MAR-2513] Read records through verified descriptors

## Description

## Human summary

Makes canonical record validation read each JSON file through the same verified file handle, blocking symlink and replacement races.

## Summary

This PR fixes MAR-2513 by hardening canonical record reads:

- opens canonical record files with no-follow semantics where the runtime supports them
- verifies the opened descriptor is still the same regular file observed at the canonical path
- records and revalidates the parent kind directory identity so directory replacement cannot silently redirect reads
- enforces the 1 MiB record limit from descriptor metadata before allocating read buffers
- reads bytes from the verified descriptor and detects growth or mutation during the read
- decodes record bytes with fatal UTF-8 validation
- normalises malformed JSON into a stable `INVALID_RECORD` validation issue without echoing source text
- preserves repository-relative paths and envelope/path-mismatch validation
- adds deterministic read-race hooks and regression coverage for symlink replacement, parent-directory replacement, oversized symlink targets, FIFO/non-regular entries, invalid UTF-8, mid-read mutation, and sensitive malformed JSON

Local verification passed:

- `bun run lint`
- `bun run typecheck`
- `bun run test`
- `bun run build`
- `bun run check:package`
- `node dist/cli.mjs validate`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11d036d27696`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.