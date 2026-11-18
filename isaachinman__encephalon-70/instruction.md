# Issue

**Title:** [MAR-2572] Reject hostile public input structures

## Description

## Human summary

Public API calls now accept only inert, exact data envelopes. Unknown fields, symbols, accessors, class instances, sparse arrays, non-enumerable application fields or indices, and hostile reflection failures are rejected as bounded `INVALID_ARGUMENT` errors before repository, cache, lock, or mutation work. Existing valid typed inputs keep their public shapes and behaviour.

## Summary

- snapshot every public input envelope from an exact operation-specific allowlist of enumerable own data properties without invoking caller getters or setters
- accept ordinary cross-realm and null-prototype objects while rejecting custom prototypes and unstable proxy metadata
- add one dependency-free dense-array authority for gather searches/shows and record supersedes/artifacts
- prove dense enumerable own indices, reject named/symbol/accessor extras, and preserve existing count-budget precedence before enumeration or allocation
- revalidate captured keys, prototypes, lengths, and descriptor values so metadata changes cannot produce an incoherent accepted snapshot
- construct add-record results only from validated fields and prove that normalised in-memory arrays and canonical JSON retain identical membership and field presence
- share supersession and artifact array inspection between candidate and canonical-record validation
- make the parent-directory replacement regression deterministic across filesystems by retaining the displaced directory generation
- retain existing exported TypeScript types, valid output shapes, field paths, limits, error codes, null-prototype compatibility, and cross-realm compatibility
- document the maintained public-input contract and exact reviewed implementation snapshot

## Verification

- two six-role parallel Luna review rounds: security, correctness, data consistency/races, test coverage, maintainability, and UX/API regression; every valid high-confidence finding addressed
- focused Luna adjudication of the Linux inode-reuse CI failure
- `bun run lint`
- `bun run typecheck`
- `bun run test` — 603 passed, 3 established platform skips
- `bun run benchmark:check`
- `bun run ./scripts/check-generated-version.ts`
- `bun run check:package`
- `bun run check:publish` — passed by recognising the expected refusal to republish existing `0.2.0`

Linear: [MAR-2572](https://linear.app/marcoappio/issue/MAR-2572/api-reject-sparse-arrays-and-accessor-bearing-input-envelopes)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `219b2e5a2608`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.