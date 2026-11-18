# Issue

**Title:** Hotfix: fast search on large encrypted vaults

## Description

Silent hotfix (server only, one new column, backfill step).
- An encrypted vault's search opened every readable note's full sealed row (body included) to rank it: 408 MB per query on the largest vault, ~38 s. Each row now also carries a small sealed score blob (vector + token set, same key, its own AAD column); ranking reads only that. Measured on 5,000 sealed notes: 147 MB to 4.5 MB per query, ~3.0 s to ~0.27 s.
- Written by the indexer on every keyed index, and by a new backfill step for existing rows (byte-budgeted, verified, not counted as plaintext remaining).
- A missing or unopenable score blob falls back to the full row, so a fault here only means today's speed.
- AI tool calls over 5 s are logged by tool name and org (no arguments).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a48059ba1fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.