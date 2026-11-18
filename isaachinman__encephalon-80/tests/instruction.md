# Issue

**Title:** [MAR-2638] Preserve committed add cleanup details

## Description

## Summary

- retain committed record progress across operation-gate cleanup
- preserve the failing gate error code, cause, and safe details while adding bounded committed-add recovery metadata
- expose only the internal gate-close test seam required by MAR-2638
- cover API precedence, non-commit failures, CLI redaction, and same-ID retry behaviour
- document the operation-cleanup contract

## Verification

- bun run typecheck
- bun run lint
- bun run test (785 tests; 782 passed, 3 platform skips, 0 failed)
- bun run benchmark:check
- bun run ./scripts/check-generated-version.ts
- bun run check:package
- bun run check:publish
- node dist/cli.mjs validate --root .
- git diff --check

## Compatibility

Successful add results and existing pre-publication or in-callback errors are unchanged. Operation-cleanup details are additive and preserve the failing subsystem classification.

## Linear

MAR-2638

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5ed36df2fb5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.