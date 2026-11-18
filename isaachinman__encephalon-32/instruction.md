# Issue

**Title:** [MAR-2535] Require package manager evidence

## Description

## Human summary

Generated baselines no longer claim npm unless a package-manager declaration or recognised lockfile supports it.

## Summary

- Replace the unconditional npm fallback with explicit package-manager evidence states: `unknown`, `declared`, `lockfile-derived`, `declared-and-lockfile`, and `conflicted`.
- Keep `packageManager` and derived script commands only when the evidence identifies one unambiguous manager.
- Preserve safe script keys even when the manager is unknown or conflicted, while omitting shell-like command strings in those cases.
- Surface declaration and lockfile conflicts deterministically through `packageManagerEvidence`.
- Document the new evidence contract in the implementation plan.
- Add init coverage for non-JavaScript repositories, package-only JavaScript repositories, every supported lockfile, declaration-only and matching declaration cases, conflicting declaration/lockfile evidence, multiple lockfiles, and baseline refresh after package-manager evidence changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `936a3b33c573`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.