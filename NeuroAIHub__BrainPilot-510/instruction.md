# Issue

**Title:** fix(runtime): acknowledge Trace acceptance before claiming persistence

## Description

## What changed
- make each durable Trace notification return a submission ID
- keep `record_trace` open until that exact notification is acknowledged by the Trace Agent
- bind acceptance to the authoritative source record/checkpoint actually appearing on a Trace node
- return JSON status `accepted`, `rejected`, or timeout-safe `submitted`
- include `nodeId` only for accepted records
- surface a quiet info message when Trace reviews and rejects process noise
- update Principal and expert personas: only `status=accepted` permits a claim that a node was recorded
- retain queued input and return `submitted` after 60 seconds if Trace has not reached a terminal decision

## Verification
- Runtime build passed
- Runtime suite: 64 files, 648 tests passed
- deterministic tests cover accepted acknowledgement, rejected acknowledgement, nodeId binding, quiet rejection guidance, existing delivery, status, and access behavior
- deployed with fresh state to the 208 Preview
- real-provider rejected path:
  - process-noise event returned `status=rejected`
  - Principal explicitly said no node was created
  - Trace remained 1/1 (Session Start only)
- real-provider accepted path:
  - substantive reusable analysis plan returned `status=accepted`
  - response included authoritative nodeId `node_6318e6d0-24ea-45ef-ab63-e92e3270f4c1`
  - Principal claimed persistence only after acceptance
  - Safari Trace showed 2/2 nodes with the matching analysis-plan node and checkpoint

## Preview note
The cloud image contains the exact product commit in this PR plus a test-only Python package mirror build commit already reviewed in #499; it is not part of this PR.

Keeping this PR Draft for review.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52d776f34a04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.