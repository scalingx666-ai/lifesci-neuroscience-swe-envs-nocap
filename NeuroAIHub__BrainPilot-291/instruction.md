# Issue

**Title:** fix(provider): probe selected Responses and Azure protocols

## Description

## Summary
- make Provider Test send a minimal request through the selected Anthropic, OpenAI Completions, OpenAI Responses, or Azure OpenAI Responses protocol
- preserve the legacy Anthropic default while surfacing real protocol, model, URL, and authentication failures
- add the CLI --api option and document protocol defaults, OpenAI base URLs, and Azure deployment names

## Testing
- npm run typecheck --workspaces --if-present
- npm test (616 tests passed)
- targeted provider, CLI, and runtime tests (118 tests passed)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13bc8947ae5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.