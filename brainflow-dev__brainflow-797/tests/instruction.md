# Issue

**Title:** Fix Node.js native library lookup in packaged Electron apps

## Description

### Motivation
- Packaged Electron apps could not locate BrainFlow native libraries because the Node.js binding hardcoded `__dirname/../brainflow/lib`, which does not resolve inside `app.asar`/packaged layouts.
- Provide a robust resolution strategy that works both in normal Node.js installs and in Electron production builds (including `app.asar.unpacked` and `process.resourcesPath`).

### Description
- Add a shared resolver `resolveLibPath()` in `nodejs_package/brainflow/lib_path.ts` that builds candidate paths (including unpacked `app.asar` and common `node_modules` locations) and returns the first existing path or the original default as a fallback.
- Update the native loaders to use the new resolver by replacing the hardcoded path in `BoardShim`, `DataFilter`, and `MLModel` with `resolveLibPath()` in `nodejs_package/brainflow/board_shim.ts`, `nodejs_package/brainflow/data_filter.ts`, and `nodejs_package/brainflow/ml_model.ts`.
- Add a small TypeScript-friendly cast to safely access `process.resourcesPath` when present in Electron.

### Testing
- Ran `cd nodejs_package && npm run build` and the TypeScript build completed successfully after adding the `process` cast. ✅
- Ran `cd nodejs_package && npm run lint` and linting failed with many existing formatting issues unrelated to this change; the failure is due to pre-existing repository-wide `prettier` violations and not introduced by this patch. ❌
- Verified the added resolver file `nodejs_package/brainflow/lib_path.ts` and that the three loaders now call `resolveLibPath()` instead of using the hardcoded `__dirname` path.

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_69a2c877ecb8832abd078ecb6a5f94a0)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65b009d381c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.