# Issue

**Title:** feat(web): add knowledge base settings build flag

## Description

## Summary

- add `VITE_KB_SETTINGS_ENABLED`, defaulting to enabled for backward compatibility
- hide the Knowledge Base settings tab and panel when the build flag is `0`
- pass the flag through the main Docker image build and document it in `.env.example`
- keep `get_domain_knowledge_local` and other built-in tool controls unchanged
- add focused settings-tab capability tests

## Deployment

Managed deployments with a pre-provisioned knowledge base can build with:

```env
VITE_KB_SETTINGS_ENABLED=0
```

This is a Vite build-time flag, matching the existing `VITE_LOCAL_MODE` pattern. Docker Compose users must rebuild the `main` image after changing it.

Cloud integration follow-up: NeuroAIHub/BrainPilot-cloud#60

## Testing

- `npm test -w @brainpilot/web` — 32 files, 238 tests passed
- `npm run build -w @brainpilot/web` — passed
- `VITE_KB_SETTINGS_ENABLED=0 npm run build -w @brainpilot/web -- --outDir /tmp/brainpilot-web-kb-disabled` — passed
- `git diff --check` — passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cce7ee28cfaf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.