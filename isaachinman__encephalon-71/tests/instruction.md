# Issue

**Title:** [MAR-2573] Centralise lossless filesystem identities

## Description

## Human summary

Filesystem identity checks now preserve full device, inode, and nanosecond metadata, closing mutation races while keeping every public API and stored format unchanged.

## Summary

- centralise lossless `bigint` filesystem identity, stable-metadata comparison, identity-key, and manifest projections in one dependency-light authority
- migrate cache, instruction, staging, and canonical-record observations without changing error codes, messages, cache bytes, manifest fields, or instruction formats
- bind record pathname and descriptor observations with complete stable metadata and retain the deliberate parent, permission-mode, and post-rename exceptions
- verify instruction quarantine recovery against the original inode incarnation before restoring the canonical path
- keep internal Node filesystem types and helpers out of the packed consumer declaration graph
- add complementary regression coverage for numeric precision, nanosecond changes, same-inode mutation, hard-link grouping, instruction quarantine, and manifest compatibility
- record the exact reviewed implementation snapshot and backwards-compatibility contract

## Verification

- frozen dependency install
- direct generated-source and workflow-policy checks
- lint and all four TypeScript projects
- full Node test suite: 613 passed, 3 established platform skips, 0 failed
- CI benchmark budgets
- build, packed-package validation, and publish-contract validation
- repository validation and diff hygiene
- two complete six-role Luna review rounds with all valid findings addressed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `714af7ec1a95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.