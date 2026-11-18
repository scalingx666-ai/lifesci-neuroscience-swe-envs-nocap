# Issue

**Title:** Make package checks portable on Windows

## Description

## Summary

- keeps the Node shebang check on every platform
- reads executable mode directly from the compressed tar header on Unix release hosts
- validates Windows through npm bin presence, lifecycle-disabled installation, and actual CLI execution

## Root cause

Windows does not expose Unix execute bits in source metadata and therefore produces npm tar headers without them. npm installs Windows command shims instead. The release is published from macOS, where the checker directly enforces the tar header's executable mode.

## Verification

- Windows passes install, typecheck, all tests, and build
- Ubuntu and macOS pass the complete package checker with direct tar-mode validation
- bun run typecheck
- bun run test: 30 Node tests and 3 Bun package tests
- bun run build
- bun run check:package

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75278bbdd50d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.