# Issue

**Title:** fix(docs): lock Tailwind oxide for Apple Silicon

## Description

## Summary

- add the missing Darwin arm64 Tailwind Oxide node to the committed lockfile
- keep the native package aligned with the already-resolved Tailwind 4.3.2 dependency
- avoid dependency upgrades and a full lockfile regeneration

## Root cause

The `@tailwindcss/oxide` lock entry declares `@tailwindcss/oxide-darwin-arm64` as an optional dependency, but the lockfile only contains concrete Linux x64 Oxide package nodes. npm therefore completes a clean install without the Darwin arm64 native binding, and the docs build fails when Tailwind loads it.

## Validation

Run on macOS Darwin arm64 with Node.js 22.23.2 and npm 10.9.8:

- `npm ci`
- `npm run docs:build`
- `npm run build`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0200c6b7c296`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.