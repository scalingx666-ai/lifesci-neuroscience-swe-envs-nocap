# Issue

**Title:** chore(release): clear dependency security audit

## Description

## Summary

Release-freeze hardening for stable v0.2.0; this PR does **not** bump versions or publish artifacts.

- update Pi coding-agent `0.80.7 -> 0.84.2` so patched `undici`, `brace-expansion`, and protobuf dependencies reach the Runtime
- migrate BrainPilot provider wiring to Pi's current per-session `ModelRuntime`, preserving non-persistent runtime API-key isolation
- retain the Azure Responses `store:false` replay fix across the upstream converter change and make the postinstall patch atomic
- update Dockerode `4 -> 5`
- update Next/Fumadocs/PostCSS and migrate static docs search from legacy Orama to Fumadocs' ZBSearch multilingual index
- remove the legacy Orama dependencies

## Security gate

- before: `npm audit` reported 11 production findings (7 high, 4 moderate)
- after clean install: `npm audit` and `npm audit --omit=dev` both report **0 vulnerabilities**

## Verification

- clean `npm ci` including postinstall patch
- `npm run version:check`
- root typecheck
- 99 test files / 1111 tests passed
- all-workspace production build passed
- docs secrets/typecheck/build passed on Next 16.3.2
- exported ZBSearch index loaded successfully; Chinese query `提供商` returned 84 matches
- Runtime and Backend `npm pack --dry-run` passed
- `git diff --check` passed

## Release coordination

Part of #462 and the v0.2.0 release freeze tracked in #491. After review/merge, exact-main 208 real-provider QA will be repeated before the final release PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35b5aada35df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.