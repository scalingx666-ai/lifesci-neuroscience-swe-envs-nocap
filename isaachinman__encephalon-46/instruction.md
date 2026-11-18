# Issue

**Title:** [MAR-2556] Bound canonical directory enumeration

## Description

## Human summary

Canonical validation and cache freshness now bound directory fan-out before sorting or reading records, while carrying verified directory generations through mutation publication so untrusted or concurrently replaced layouts cannot be accepted.

## Summary

- Stream at most `limit + 1` entries from canonical root and kind directories, closing directory handles on every path and sorting only bounded results.
- Enforce 1,002 raw root entries, 1,000 kind directories, and 1,000 entries per kind with one deterministic `CORPUS_DIRECTORY_ENTRY_LIMIT` issue that never exposes excess filenames.
- Share canonical layout limits and reserved-directory policy between validation, mutation preflight, and cache manifest generation.
- Bind root, kind, staging, and artifact observations to verified real-directory generations and classify replacements through stable validation or repository-change paths.
- Carry validated generations through add/init planning, directory preparation, publication, post-link verification, and cache hydration; reject candidate layout overflow before any canonical publication.
- Stop recursively deleting unowned staging entries; each mutation cleans only its own verified unique staging file, leaving ownership-safe orphan recovery to MAR-2569.
- Preserve genuine operational I/O errors, prevent symlink/junction ancestor substitutions from producing accepted metadata, and keep internal witness types out of public package declarations.
- Add deterministic resource-bound, ordering, cleanup, replacement, publication, manifest, cache, and concurrent-suite regression coverage.
- Document the maintained layout limits, reserved-tree handling, publication generations, and cache freshness contract.

## Validation

- `bun run test`: 269/269; five consecutive concurrent runs plus a final fresh run
- `bun run lint`
- `bun run typecheck`
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish`

Linear: https://linear.app/marcoappio/issue/MAR-2556/validation-bound-canonical-directory-enumeration-before-sorting

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05a983287fd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.