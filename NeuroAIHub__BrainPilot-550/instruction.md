# Issue

**Title:** fix(runtime): use system role for custom completion gateways

## Description

## Summary

Custom OpenAI-compatible Chat Completions gateways can reject the first message when a reasoning model sends the system prompt with the `developer` role. Session models now default to `compat.supportsDeveloperRole: false` outside the native `https://api.openai.com` origin, sending `system` while retaining reasoning.

## Related Issues

## Changes

- Add the compatibility default in `resolveSessionModel`; preserve native OpenAI and other API families.
- Inspect real Pi ModelRuntime/Chat Completions request payloads in regression tests, stopping before network access. Cover the reported Aliyun URL, unknown gateways, adapter-derived API selection, native OpenAI, a lookalike hostname and other protocols.

## Type of Change

- [x] Bug fix

## Verification

### How to test

1. Run `npx vitest run packages/runtime/src/__tests__/provider-system-role.test.ts packages/runtime/src/__tests__/pi-provider.test.ts packages/runtime/src/__tests__/provider-config.test.ts`.
2. Run the full typecheck, root/Web tests and workspace/docs builds.
3. During integrated acceptance, send a message through a custom gateway with reasoning enabled and confirm the prompt is accepted.

### What you personally verified

- Focused request-construction coverage passes; removing the fix makes four new cases fail. Prompt text and `reasoning_effort: medium` are preserved; request-inspection tests never contact a provider.
- Full local verification on `df50bc22`: typecheck, 1,120 non-Web tests, 658 Web tests, docs checks and all workspace builds passed.
- The later base update only incorporates the merged dependency fixes. Required CI and both CodeQL analyses passed on current head `c4f542121b4dc53e1d8bf27f674b7d798ad92846`.
- Live Aliyun-specific validation has not been performed. Real-provider and integrated release acceptance remain a separate 0.2.3 gate.

### Checks

- [x] Full local typecheck
- [x] Full local root/Web tests
- [x] Docs checks/build and all-workspace build
- [x] Current-head required CI and CodeQL

## Checklist

- [x] AI-assisted; generated code has been self-reviewed
- [x] Request-level regression coverage added
- [x] No settings schema, UI or other protocol behavior changed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfb2cd903fa0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.