# Issue

**Title:** [MAR-2541] Deflake instruction replacement identity checks

## Description

## Human summary

Instruction-file deletion now recognises byte-identical file replacements on CI, so the flaky Ubuntu test no longer depends on filesystem timing.

## Summary

- Strengthens instruction-file identity from dev/inode to nanosecond stat metadata captured as strings.
- Splits deletion verification into a full original-path identity check before rename and a rename-stable quarantine check after rename.
- Adds a deterministic regression that simulates inode reuse for a byte-identical replacement.
- Saves the CI flake learning in Encephalon as `review.inode-reuse-file-identity`.

Verification run locally:

- `node --test --test-name-pattern "byte-identical instruction replacement|different file containing identical bytes" test/init.test.ts` repeated 50 times
- `node --test test/init.test.ts`
- `bun run typecheck`
- `bun run lint`
- `bun run test`
- `bun run build`
- `bun run check:package`
- `node ./node_modules/encephalon/dist/cli.mjs validate`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8a5b5b5bd6e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.