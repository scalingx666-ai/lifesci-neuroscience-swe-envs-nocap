# Issue

**Title:** [MAR-2521] Bound payload validation safely

## Description

## Human summary

Record payload validation now rejects unsafe JavaScript objects without running caller code, and it has explicit limits so very deep or wide payloads fail predictably.

## Summary

- Replace recursive payload validation with an iterative descriptor-based traversal.
- Reject payload getters, setters, symbol keys, descriptor/proxy inspection failures, cycles, sparse arrays, and over-budget structures with stable `INVALID_ARGUMENT` errors.
- Normalize `-0` to canonical `0` before returning and formatting record payloads.
- Add explicit payload budgets of 64 nested levels and 10,000 JSON nodes to the README and implementation plan.
- Add regression coverage for accessors, hostile descriptors, cycles, depth and node boundaries, sparse arrays, and canonical negative-zero formatting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62fc072ba6c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.