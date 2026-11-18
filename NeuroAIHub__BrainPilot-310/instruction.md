# Issue

**Title:** feat(backend-core): per-user sandbox in Docker dynamic mode

## Description

.

## What
Implements per-user sandbox allocation for `dynamic` Docker mode — the "登录用户无沙盒时自动分配 per-user sandbox" link that was previously only a commented skeleton.

## How
- **`orchestrator.ts`** — add `EnsureRuntimeOptions.userId` (routing key) and `stopRuntime(userId?)` (multi-tenant semantics). Optional → existing impls/callers unchanged.
- **`PerUserDockerOrchestrator`** (new) — a multi-tenant layer over the tested single-user `DockerOrchestrator`:
  - `Map<userId, …>` + host **port pool** (`BP_DYNAMIC_PORT_MIN/MAX`)
  - per-user `dataDir` = `<dataRoot>/<userId>`
  - **per-user single-flight** (issue #58 pattern) so concurrent first requests share one launch
  - **idempotent reuse** of a healthy container; recreate when unhealthy
  - **idle reclaim** (#301 req 4 / R-3): stop+remove a user's container with `runningAgents === 0` idle past `BP_DYNAMIC_IDLE_MS`, read from the runtime `/metrics`; never reaps on a transient probe failure
  - no `userId` → single shared instance (backward compatible with today's docker mode)
- **`create-orchestrator.ts`** — `BP_DYNAMIC=1` (or `options.perUser`) selects per-user in docker mode; reads `BP_DYNAMIC_PORT_MIN/MAX`, `BP_DYNAMIC_IDLE_MS`, `BP_SANDBOX_IMAGE`. Default docker path stays single-instance.
- **`app.ts`** — resolve user id from the `X-BP-User` header (trust-front, #21/#35; sanitized), cache one `RuntimeClient` per `baseUrl`, thread `userId` into `ensureRuntime`. `/auth/me` reflects the identity (`local` fallback unchanged).
- **`docker-compose.dynamic.yml`** — skeleton → runnable minimal example (main + docker.sock + `BP_DYNAMIC` + port pool + data volume).
- **README** — dynamic vs static selection + `X-BP-User` gateway contract.

## Identity contract (note for reviewers)
`X-BP-User` is a **new contract for the downstream auth gateway** — this repo only *consumes* it. When absent (bare self-hosted run) it falls back to a single `local` sandbox, so single-user behaviour and the `/auth/me` contract are unchanged.

## Tests
- `per-user-docker-orchestrator.test.ts` (12): per-user isolation, idempotent reuse, unhealthy recreate, no-userId fallback, single-flight, port release/exhaustion, launch-failure port release, stop-all, idle reclaim (reap / running-agents / unreadable-metrics).
- `app.test.ts` (+3): `X-BP-User` routing, `local` fallback, `/auth/me` identity.
- `create-orchestrator.test.ts` (+2): `BP_DYNAMIC` switch on/off.

Repo-wide `typecheck` passes; `@brainpilot/backend-core` `186 passed`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d198441e5344`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.