# Issue

**Title:** [MAR-2549] Preserve exclusive gate recovery state

## Description

## Summary

- preserve the exclusive-creation requirement after a corrupt operation gate is quarantined
- bind every successful gate retry to the exact verified gate generation
- reject an externally inserted successor with the existing REPOSITORY_CHANGED classification

## Changes

- retain the verified gate identity after BEGIN IMMEDIATE
- carry create-exclusive and expected-owned state across recovery-marker ownership loss
- add a deterministic regression test for successor insertion between quarantine and recovery reacquisition

## Compatibility

- public API signatures, CLI behaviour, package exports, and successful operation-lock behaviour are unchanged
- the failing subsystem keeps the existing REPOSITORY_CHANGED code and stable-identity details
- recovery remains bounded and existing safe ownership-reacquisition paths remain supported

## Validation

- 487 tests passed with 2 established filesystem-capability skips and 0 failures on macOS Node 24
- the complete Linux matrix passed on Node 24 and Node 26 with 485 passes, 4 established skips, and 0 failures
- lint, all TypeScript projects, benchmarks, build, package checks, diff checks, and repository validation passed
- six-role specialist review completed with no findings

## Review

- this is a narrowly scoped follow-up to MAR-2549 discovered during the ordered PR #55 review
- the ticket queue remains paused until this PR, its bot review, its CI, and subsequent main CI are fully green

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `181b40929603`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.