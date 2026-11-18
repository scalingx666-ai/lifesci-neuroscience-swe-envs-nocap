# Issue

**Title:** [MAR-2537] Align declarations with minimum Node runtime

## Description

## Human summary

Keeps TypeScript checking aligned with the supported Node 24 runtime so the library cannot accidentally rely on newer Node-only declarations.

## Summary

- Pins `@types/node` to the Node 24 declaration line and removes ambient Bun types from project-wide typechecking.
- Splits typechecking into source, scripts, tests, and a runtime guard so runtime code only sees Node declarations while build scripts keep a narrow local Bun surface.
- Replaces script-only `import.meta.dir` usage with Node URL/path helpers.
- Adds a guard that fails if Node 26-only declarations, such as `node:ffi`, become visible to runtime source typechecking.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d07aa8883c83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.