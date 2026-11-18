# Issue

**Title:** fix(backend): report unsupported MCP BYOK cleanly

## Description

## What changed
- add an explicit self-hosted `GET /api/mcp-servers/byok` capability response
- return `204 No Content`, which the existing Settings probe interprets as unsupported
- keep hosted JSON-array behavior available for hosted deployments that replace this endpoint

## Verification
- MCP backend tests: 25 passed
- full repository production build passed
- response body is empty and status is 204

Kept as Draft for coordinated review. No merge or release action was taken.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08d1e6586786`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.