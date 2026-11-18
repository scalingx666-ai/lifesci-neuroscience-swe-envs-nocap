# Issue

**Title:** [MAR-2524] Centralise runtime package version

## Description

## Human summary

Encephalon now gets its runtime version from package.json, rejects stale root installs, and keeps compatible caches across package-only version changes.

## Summary

- Generate `src/generated/version.ts` from `package.json` during build and use it for CLI output, cache metadata, and root-install verification.
- Stop treating diagnostic package-version metadata as part of cache freshness; schema version remains the cache compatibility key.
- Reject root installations whose manifest version differs from the executing bundle.
- Teach package checks to fail when generated version metadata or built CLI output is stale.
- Add regression coverage for package-version cache reuse, schema-version rebuilds, CLI version output, and generated metadata sync.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe1327d7f246`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.