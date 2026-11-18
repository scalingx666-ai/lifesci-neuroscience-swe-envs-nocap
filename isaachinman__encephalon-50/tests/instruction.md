# Issue

**Title:** [MAR-2547] Finalise managed instruction replacements

## Description

## Summary

- Finalise managed `AGENTS.md` and `CLAUDE.md` replacements without leaving Encephalon-owned backup, temporary, or deletion aliases after success.
- Bind writes and removals to fixed repository-root and exact file identities, preserving concurrent successors and historical generated-looking files.
- Make the hard-link publication point explicit and return bounded, privacy-safe committed-state details when durability or cleanup remains incomplete.
- Harden private staging, recovery, retry, collision, directory-flush, descriptor-cleanup, and cross-platform permission handling.
- Update the maintained contract, README, changelog, design, implementation plan, and focused race/fault-injection coverage.

## Why

The previous successful replacement path could leave a hidden `.backup` containing prior user instructions. Failures after the new canonical file was published also looked like ordinary pre-commit failures, making recovery ambiguous and risking unsafe cleanup.

## Behaviour

- Normal success leaves only the canonical instruction file.
- Pre-commit failures restore or retain the exact predecessor without overwriting a successor.
- Post-commit failures preserve the new canonical result and report `instructionCommitted`, the failed phase, safe recovery actions, and exact bounded repository-relative recovery paths where available.
- Repeating the same `init` operation with the same options is deterministic and re-establishes directory durability without duplicating managed blocks.
- Public method signatures and the managed block format are unchanged.

## Validation

- `bun run lint`
- `bun run typecheck`
- `bun run test` — 395 passed, 0 failed, 2 capability skips
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run check:package`
- `bun run check:publish` — expected existing-version refusal handled successfully
- `bun install --frozen-lockfile` — no changes
- Three specialist review waves plus CodeRabbit review; all high- and medium-confidence findings addressed

Linear: [MAR-2547](https://linear.app/marcoappio/issue/MAR-2547/managed-files-finalize-instruction-replacements-without-leaking-backup)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df2137801edd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.