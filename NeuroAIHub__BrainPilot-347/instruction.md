# Issue

**Title:** fix(runtime): rewrite logical /workspace onto durable session workspace

## Description

## Summary

- Fixes agent writes to absolute `/workspace/...` landing on the **ephemeral container layer** instead of `workspaces/<sid>/` on the volume (data loss after idle reclaim).
- Adds a Pi `tool_call` extension (`managed-path-guard`) that rewrites logical managed prefixes and confines `write`/`edit` to durable roots.
- Mirrors HTTP `resolveManagedPath` semantics for agent tools so Files panel and agent FS agree.

## Changes

| Area | Behavior |
|------|----------|
| `/workspace/*` | → session cwd (prefer relative path) |
| `/data/*` | → `persistentDir` absolute path |
| `/attachments/*` | → `cwd/.attachments/` |
| `/shared/*` | → `sharedDir` when configured; writes denied |
| `write`/`edit` outside durable roots | blocked with a clear error |
| `bash` | best-effort rewrite of path-bounded `/workspace` tokens |

Registration order: managed-path-guard **before** router-skill-guard (#309) so path denies see post-rewrite paths.

## Test plan

- [x] Unit tests: `managed-path-rewrite`, `managed-path-guard`
- [x] Wiring: `two-skill-paths` asserts `managedPathRoots` on factory params
- [x] Full `@brainpilot/runtime` suite (432) + typecheck
- [ ] Manual / cloud: agent `write` to `/workspace/foo.txt` appears under Files `path=/workspace`
- [ ] Manual: two sessions writing `/workspace/x` do not clobber each other
- [ ] Manual: after sandbox stop/wake with only `BP_DATA_DIR` volume, file still present

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `965c8ce2f1a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.