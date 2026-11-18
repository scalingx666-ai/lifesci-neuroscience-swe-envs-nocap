# Issue

**Title:** api_config: start each load from empty address and interface lists

## Description

. `load()` now clears `multicast_addresses_`, `machine_addresses_` and `multicast_interfaces` first, so a fallback load after a failed one doesn't append to leftovers. These are the only members `load()` appends to; everything else is assigned. No new test (it would need another single-singleton test executable for a 3-line clear); existing config/resolve tests pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb50e8e47cdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.