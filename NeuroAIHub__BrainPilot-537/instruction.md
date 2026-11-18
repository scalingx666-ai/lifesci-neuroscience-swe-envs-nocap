# Issue

**Title:** fix(web): show Cloud-unavailable plugin state

## Description

## Summary

- show a compact localized Cloud-unavailable state when hosted users open Plugins
- keep the existing local/self-hosted plugin marketplace unchanged
- avoid mounting the marketplace component in hosted mode, so the page issues no plugin marketplace, installed, updates, or MCP status requests

## Validation

- npm test -w @brainpilot/web (80 files, 653 tests)
- npm run build -w @brainpilot/web
- VITE_LOCAL_MODE=0 npm run build -w @brainpilot/web

Supersedes #536, whose author cannot satisfy the protected branch requirement with the available reviewer account.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `428388ba00ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.