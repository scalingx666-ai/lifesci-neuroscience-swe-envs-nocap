# Issue

**Title:** [MAR-2539] Correct README privacy and asset claims

## Description

## Human summary

Corrects the README privacy and image packaging claims so users can trust what `init` reads and the packaged README renders its local image.

## Summary

- Replaces the inaccurate README privacy sentence with the implemented boundary for baseline scanning and managed instruction-file reads.
- Includes `assets/encephalon.png` in the npm tarball whitelist so the packaged README image resolves locally.
- Extends `check:package` to assert repository-relative README references resolve inside the packed tarball.
- Adds an init fixture proving unrelated instruction-file content is not stored in generated records, indexed for search, printed to stdout, or leaked in structured error details.

Verification:
- `bun run typecheck`
- `bun run lint`
- `bun run test`
- `bun run build`
- `bun run check:package`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76392beda21c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.