# Issue

**Title:** [MAR-2791] Remove recursive source inventory from init

## Description

## Summary

Remove recursive source inventory from `init`. Initialisation now derives its three generated subjects from a bounded root snapshot, verified root `package.json`, and bounded workflow filenames. Nested source files no longer affect the baseline or its collection cost.

## Problem

The language scanner descended through source trees, retained a traversal queue and directory witnesses, and counted extensions and regular files. On a 40,000-source-file fixture, this added 810 directory enumerations and 19,438 metadata probes to baseline collection, despite the baseline being intended as shallow repository discovery.

## Design

Delete the recursive scanner, extension map, queue, limits, recursive truncation reasons, and language-only work observers/hooks. Keep the existing root/package/workflow collectors, their independent no-follow evidence, final source validation and shared retry deadline unchanged. Only the generated overview changes: it omits `languageCounts` and `scannedRegularFiles` and identifies itself as shallow. Tooling and command payloads retain their existing fields and structured argv semantics.

## Scope

- Remove recursive production work and eleven obsolete language-specific test cases.
- Replace the existing baseline-work test with one complementary regression that observes actual directory opens before and after adding 4,000 nested source files, checking identical payloads and shallow work.
- Update the README, public contract, relevant implementation-plan section and shipped skill guidance, including historical refresh/search behaviour.
- Record the decision as append-only Encephalon architecture knowledge.

## Deliberately excluded

No init publication or instruction sequencing changes, cache/schema changes, new filesystem abstractions, broader observer removal, Git-index parsing, source-body scanning, test framework changes or benchmark-budget changes.

## Compatibility

Ordinary init preserves existing generated heads. `init --refresh-baseline` appends replacements for changed or conflicting generated subjects through the existing supersession mechanism; unchanged subjects keep their current records. Historical language/file facts remain valid and searchable when superseded records are included. The synchronous public API, three generated subjects, package-manager/workspace/script semantics, no-follow source validation, bounded errors and partial-commit recovery remain intact.

## Performance

Supplemental init diagnostic on Node 24.15.0, same runner and shallow topology, 20 measured fresh processes plus two warm-ups per side/fixture. Setup and reset are outside timing; filesystem instrumentation is separate. The base demonstrably visits all 40,000 source files without truncation. RSS is process peak RSS. Campaigns ran sequentially, so the operation counts provide the direct scaling proof.

| Large fixture | Current main | Candidate |
| --- | ---: | ---: |
| Init median | 243.950 ms | 116.632 ms |
| Init p95 | 264.625 ms | 119.000 ms |
| Median CPU | 210.131 ms | 55.644 ms |
| Median peak RSS | 117,342,208 B | 111,230,976 B |
| Baseline directory enumerations | 810 | 2 |
| Baseline `lstat` calls | 19,438 | 54 |

Candidate baseline payloads and measured filesystem-operation counts are identical with four or 40,000 nested source files. The unchanged common benchmark does not contain init; its full 600-sample local comparison against `3c89cbf0c0d74e01d8c0744237ee9cc8dbc51284` passed all 53 metrics. The first CI campaign passed all 58 performance comparisons across 600 samples. These measured `d685f76`; the only subsequent change is the Windows test-path expectation, with identical production and package bytes. Final-head CI independently remeasured all 600 samples and passed all 58 comparisons with zero violations.

## Verification

- Lint/typechecking, 817 runtime tests (three platform skips, 52 seconds), 91 tooling tests, build, generated-version check, package validation and benchmark smoke passed.
- New no-traversal regression failed against the base and passes against the candidate.
- Publish dry run only; no publication.
- Published 0.2 release gate and actual published 0.3 / preceding-main upgrade–downgrade checks passed; canonical/artifact data remained unchanged.
- Packed CLI checks passed. Additional published-0.3 single-package and workspace fixtures validate before/after refresh, retain every historical record byte, append one changed overview, retain three active subjects, preserve historical search, and append nothing on repeated refresh. Existing tests cover multiple generated heads.
- All 52 repository records validate. Independent Pro design and implementation review completed with no actionable findings after verifying the fixture does not truncate.
- The first CI run finished in 4m46s. Its new Windows regression expected a short-name path alias while the production witness correctly used the native long path. The test now resolves its expectation with the same native API. All required local checks passed again after this test-only correction.
- Final head: `46643d165ed6f37bf18ffe86a7d8a0810935bf3c`. CI run 34519339328 passed all 23 jobs in 5m01s (longest job 4m35s), with 600 raw performance samples and 58 passing comparisons. Greptile review 2 / check 103013555961 returned 5/5 on this exact head with no unresolved findings.

## Risk and rollback

Consumers that relied on generated language/file inventory must discover it separately; historical payloads remain readable. Reverting the implementation restores generation of those fields, and an explicit refresh appends the restored view without rewriting history.

## Linear

Closes [MAR-2791](https://linear.app/marcoappio/issue/MAR-2791/init-remove-recursive-language-and-regular-file-inventory).

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

Initialisation now generates its three baseline subjects from shallow repository metadata without recursively inventorying source files.
- Removes recursive language detection, file counting, traversal limits, hooks, and truncation reasons.
- Preserves bounded root, package metadata, and workflow collection with existing source validation and retry behavior.
- Adds a regression verifying constant directory enumeration as nested source inventory grows.
- Updates the public contract, implementation guidance, README, skill documentation, and architecture history.

<h3>Confidence Score: 5/5</h3>

The PR appears safe to merge.

No blocking failure remains.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| src/baseline.ts | Removes recursive source traversal and omits language and regular-file counts while retaining shallow baseline collection. |
| test/init.test.ts | Removes obsolete recursive-scanner assertions while preserving coverage for retained root, package, workflow, retry, and truncation behavior. |
| test/performance.test.ts | Replaces recursive-work accounting with a regression proving nested files do not alter payloads or directory-open counts. |
| docs/contract.md | Updates the public initialization contract and compatibility behavior to describe shallow baseline generation. |
| skills/encephalon/SKILL.md | Directs agents to discover languages and frameworks separately because initialization no longer inventories source trees. |
| encephalon/architecture/7ba27f9e-59a6-421d-830a-f449f116e389.json | Records the shallow-baseline architecture decision and retained compatibility guarantees. |

</details>

<sub>Reviews (2): Last reviewed commit: ["\[MAR-2791\] Resolve native Windows paths ..."]() | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=62742132)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c89cbf0c0d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.