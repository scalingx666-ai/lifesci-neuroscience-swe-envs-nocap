# Issue

**Title:** fix(web): harden Live Demo bundles

## Description

## Summary

- address produced-file reads by session id and preserve `/workspace`, `/data`, and `/shared` roots
- cap raw timelines at 12 MB and complete Live Demo bundles at 40 MB
- strictly validate imported bundle versions and replay-critical structures
- disclose bundled raw events, tool data, reasoning details, and output files before export
- add regression coverage for routing, multi-root artifacts, size limits, and malformed imports

## Verification

- `npm test --workspace=@brainpilot/web` — 31 files, 235 tests passed
- `npm run build --workspace=@brainpilot/web` — passed
- `git diff --check` — passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5a1f44f15a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.