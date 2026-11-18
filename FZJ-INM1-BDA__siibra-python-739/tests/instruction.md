# Issue

**Title:** Enh trx

## Description

This PR adds two small features on top of the decoder refactor in `maint_decoders`.

* Adds a `.trx` decoder backed by `trx-python` (optional dependency, requires Python ≥ 3.11). The decoder is registered at import time if `trx-python` is available, and silently omitted otherwise. Declared as `siibra[trx]` in `pyproject.toml`.
* Extends `_get_suffix` and `Decoder.from_filename` to extract the effective file suffix from nested percent-encoded query parameters, enabling correct decoder selection and cache naming for EBRAINS data-proxy-zipper URLs.
* Adds a `Decoder.__repr__` that shows the fully qualified function name, input type, and kwargs, replacing the opaque `<function load at 0x...>` default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `970e6128a2e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.