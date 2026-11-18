# Issue

**Title:** feat(got): add audited Trace Graph v2 core

## Description

## Summary

Introduces the GoT v2 canonical model and the independent Trace/Auditor delivery loop.

- stores causal authority only in nodes[].parents and exposes confirmed depends_on edges through the V1 materialized view
- adds Session Start, candidate/confirmed/rejected/uncertain review states, cycle repair, revoked nodes, and an append-only change log
- binds Trace records and Auditor targets in the Host
- rebuilds Auditor deduplication after restart, preserves unconcluded reviews, and requeues a stale fingerprint exactly once
- exposes a compact active graph to Trace and removes legacy relation/episode mutation tools

## V1 migration boundary

- valid V1 depends_on relations migrate to confirmed causal parents; actual cycles are repaired
- non-causal V1 relation types such as follows and supports are intentionally not part of GoT v2 and are not migrated or exposed as semantic links
- this is an intentional compatibility break: deployments that need those historical non-causal records should archive/export the V1 trace before upgrading
- there is no automatic causal replacement for discarded semantic relations because promoting them would change their meaning

## Deliberately excluded

- Principal GoT context injection and PI GoT view changes
- workspace checkpoint and restore execution
- Web UI
- plugins, subagents, trace search, semantic links, and legacy episode/relation tools

## Validation

- full production build passed
- full repository test suite passed at this stack layer
- focused GoT core/audit tests cover canonical persistence, migration, cycles, audit restart dedupe, unconcluded review durability, and stale fingerprint requeue
- diff contains protocol/runtime files only

## Stack

1. This PR
2. Workspace checkpoints and causal restore
3. GoT Web UI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da13fc127078`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.