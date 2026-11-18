# Issue

**Title:** chore(release): bump version to 0.0.13

## Description

Bump all workspace packages from 0.0.12 → 0.0.13 and regenerate lockfile.

## Highlights since v0.0.12 (26 commits)

**Features**
- `feat(skills)`: add `fmriprep` skill to 06_fMRI_Neuroimaging (#280)
- `feat(runtime)`: cross-user read-only shared root (`/shared`, legacy parity) (#279)
- `feat(web)`: fold non-fatal agent errors by default + agent-panel toggle + red-dot badge (#278, #281)
- `feat(tools)`: per-tool on/off toggles for skill_search + local KB tools (#277)
- `feat(web)`: no-provider banner with a CTA to Settings → Providers
- `feat(demo)`: draggable + persisted panel dividers in Live Demo (#275)

**Fixes**
- `fix(runtime)`: pin pi-coding-agent 0.80.3; Azure Responses `store:false` reasoning fix via postinstall (#265)
- `fix(runtime)`: strip Azure Responses server item ids on stateless replay
- `fix(web)`: ask_user takes over the composer to prevent session hangs (#272, #273)
- `fix(demo)`: replay perf + cache correctness (concurrent packing, real node times, missing-file notice, abort, URL revocation, O(1) fold) (#274)
- `fix(backend-core)`: JSON error handler so runtime-start failures reach the UI
- `fix(web)`: guard handleJson against non-JSON 2xx responses

**Chore**
- `chore(release)`: bump version to 0.0.13 (this PR)

## Verify
- `npm run typecheck` ✅
- `npm test` ✅ 739 tests
- `packages/web` vitest ✅ 227 tests
- `npm run build` ✅ (docs pkg — private, unrelated `next` missing)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb8e5e348ceb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.