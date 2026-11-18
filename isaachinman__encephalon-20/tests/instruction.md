# Issue

**Title:** [MAR-2523] Bound validation corpus traversal

## Description

## Human summary

Validation now has explicit corpus limits and stops reporting runaway errors predictably, so large or malformed repositories cannot exhaust memory or the call stack.

## Summary

- Add documented v0.x limits for canonical record count, aggregate record JSON bytes, supersession edges, artifact references, and returned validation issues.
- Replace recursive supersession cycle detection with an iterative state traversal that handles long chains and cycles without stack growth.
- Stop scanning once hard record-count, aggregate-byte, or scan-error budgets are exceeded.
- Add `ValidateResult.truncated` and a deterministic `VALIDATION_ISSUES_TRUNCATED` sentinel when more than 100 issues exist.
- Add regression coverage for exact record-count boundary, corpus budget overflows, long chains, long cycles, excess artifacts/edges, byte overflow, and deterministic issue truncation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab11d201979d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.