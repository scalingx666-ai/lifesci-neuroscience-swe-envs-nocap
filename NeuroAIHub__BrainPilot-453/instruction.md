# Issue

**Title:** fix(runtime): normalize optional tool schemas

## Description

## Summary

- normalize object tool schemas at the final OpenAI Chat Completions provider boundary
- cover built-in, custom, MCP, and active extension tools after Pi combines them
- preserve existing required arrays and leave other provider APIs unchanged
- add unit coverage and an end-to-end Kimi-compatible contract regression test

## Testing

- `BP_MOCK=1 npm test -w @brainpilot/runtime` — 573 passed
- `npm run typecheck`
- `BP_MOCK=1 npx vitest run packages/runtime/src/__tests__/tool-schema-compat.test.ts packages/runtime/src/__tests__/openai-tool-schema-compat.test.ts` — 7 passed

## AI assistance

This PR was implemented and self-reviewed with AI assistance.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d01d61b8ca09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.