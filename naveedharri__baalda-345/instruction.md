# Issue

**Title:** Release 0.1.93 (silent)

## Description

Security: desktop `rustls` 0.23.45 → 0.23.46 (Dependabot #78–#81). Lockfile-only; `cargo check` and `cargo test` pass. Version 0.1.93, silent.

The six better-auth alerts (#82–#87) are dismissed as not used: they need the Magic Link, OAuth Proxy or device-authorization plugins, or Postgres-stored rate limits, none of which this server uses. Upgrading to better-auth 1.7 requires porting the removed `mcp` plugin and is tracked separately.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `374b600265c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.