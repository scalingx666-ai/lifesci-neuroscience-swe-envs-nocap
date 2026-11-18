# Issue

**Title:** [MAR-2555] Validate artifact paths through stable no-follow identities

## Description

## Summary

- add one descriptor-backed artifact inspector with stable no-follow identity checks
- carry verified artifact observations from record validation into cache rebuilds
- reuse the same verification primitive for cache freshness checks
- preserve bounded repository-change retries, operational I/O classification, and the existing manifest digest
- document the artifact identity and cache metadata contract

## Root cause

Artifact validation and cache manifest generation independently inspected pathnames. A file or ancestor could therefore change between validation and metadata collection, and cache rebuilds could consume metadata from a different filesystem generation.

## Implementation

- capture the brain directory once per inspection batch and bind every artifact ancestor to its verified parent generation
- compare bigint metadata across initial `lstat`, descriptor `fstat`, final descriptor `fstat`, and final pathname `lstat`
- use `O_NOFOLLOW` where supported while retaining conservative cross-platform identity checks
- derive manifest fields only from verified descriptor metadata
- distinguish stable invalid artifacts, repository changes, and operational filesystem failures without exposing absolute paths

## Validation

- `bun install --frozen-lockfile`
- `bun run lint`
- `bun run typecheck`
- `bun run test` — 329 passed, 0 failed, 2 capability skips
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` — expected refusal for the already-published `0.2.0`

## Compatibility

- public API and generated declarations are unchanged
- the legacy cache manifest digest is preserved
- `bunfig.toml`, `package.json`, and the plaintext `bun.lock` are unchanged

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fffb02d6a58e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.