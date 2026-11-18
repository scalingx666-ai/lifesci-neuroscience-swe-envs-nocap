# Issue

**Title:** integrate geak_v4 with hyperloom

## Description

## What changed

### New: `interface/run_e2e.py` + `interface/run_e2e.md` (the integration contract)
The **only** surface an external orchestrator touches. Everything volatile
(the `e2e_workflow.js` arg names, the Claude Code `Workflow` invocation, the
`--effort ultracode` requirement, SDK-vs-CLI choice) is hidden behind one
command + two JSON files:

```bash
python interface/run_e2e.py <handoff.json> <result.json> [--dry-run]

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c739180697a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.