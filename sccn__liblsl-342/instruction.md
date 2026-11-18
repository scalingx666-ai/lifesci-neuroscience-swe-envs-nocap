# Issue

**Title:** Fix typos in test configs; warn about list values without braces

## Description

.

- `ipv4_lsl100.cfg` / `ipv6_lsl100.cfg`: `use_protocol_version` → `UseProtocolVersion`.
- `default.cfg`: `KnownPeers=127.0.0.1` → `KnownPeers={127.0.0.1}`.
- `parse_set` logs a warning when it ignores a non-empty value not in braces. (No warning for unknown keys: that needs a list of all known keys; left out.)

Notes:
- CI doesn't actually load these files: `cppcmake.yml` copies `default.cfg` into the working directory, but liblsl only reads `lsl_api.cfg` there (or `LSLAPICFG`). So this PR doesn't change CI.
- With `UseProtocolVersion=100` now applied (`LSLAPICFG=testing/lslcfgs/ipv4_lsl100.cfg lsl_test_exported`), 16 exported tests time out. All are sync-outlet cases (`sync_outlet_*` and the `transp_sync_blocking` variants of the `have_consumers` tests), which refuse data protocol 1.00 by design (`505 Synchronous outlet requires data protocol 1.10`). Those tests don't skip under 1.00; worth a follow-up if these configs are meant to be run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb50e8e47cdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.