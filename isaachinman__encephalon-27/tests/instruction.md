# Issue

**Title:** [MAR-2530] Plan init records from one snapshot

## Description

## Human summary

Initialisation now plans generated records from one repository snapshot, reducing repeated scans while preserving durable writes and safe reruns.

## Summary

- Refactor record creation into reusable planning, combined-graph validation, and durable publication helpers.
- Update `init` to read canonical records once under the operation lock, scan the generated baseline once, validate the planned combined graph once, and publish planned records without rescanning for each addition.
- Use freshness-aware cache preparation when no generated records changed, while still forcing cache hydration after new canonical records are published.
- Add instrumentation-backed init tests for first run, idempotent rerun, one-subject refresh, three-subject refresh, and mid-batch publication failure convergence.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eccdc4711255`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.