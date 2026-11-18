# Issue

**Title:** Fix create_decoding_view for 2D decoders

## Description

## Description

. `DecodingOutput.create_decoding_view()` raised `ValueError: 'position' not found in array dimensions ('time', 'x_position', 'y_position')` for 2D decoders, because the posterior was normalized over a hardcoded `"position"` dimension *before* the 1D/2D branch was reached.

Validating the arguments passed to the downstream `non_local_detector` figurl functions (per reviewer request) surfaced **two further latent bugs** on the 2D and 1D paths — both previously masked by that crash.

## Changes

### `src/spyglass/decoding/decoding_merge.py`
1. **Posterior normalization** — normalize over the correct spatial dimension(s): `["x_position", "y_position"]` for 2D vs `["position"]` for 1D. *(the reported bug)*
2. **`head_dir` argument** — the default `head_direction_name="head_orientation"` is the legacy `common_position` column; v1 Trodes/DLC position (what the decoding pipeline consumes) uses `"orientation"`, so a 2D view would `KeyError`. Now resolves the orientation column, falling back to `None` (the argument is optional in `create_2D_decode_view`), with `logger.warning` on substitution or drop so it is not silent.
3. **`linear_position` argument (1D path)** — `fetch_linear_position_info` returns a multi-column DataFrame, but `create_1D_decode_view` expects a 1D array. Now passes the `"linear_position"` column.

### `src/spyglass/decoding/utils.py` (centralization — per @CBroz1's review)
Adds `resolve_orientation_col(df, orientation_name=None) -> str | None` as a single source of truth for orientation-column resolution: it honors a requested column when present, otherwise prefers `"orientation"` over `"head_orientation"`, and returns `None` when neither is found. The 2D merge path and both v1 `get_orientation_col` methods (`SortedSpikesDecodingV1`, `ClusterlessDecodingV1`) now delegate to it, removing the previously duplicated logic. The v1 methods keep their exact prior behavior via `resolve_orientation_col(df) or "head_orientation"`, so `get_ahead_behind_distance` is unchanged.

## Tests

- `tests/decoding/test_create_decoding_view.py` — DB-free unit tests (mock the four `fetch_*` classmethods, patch the view functions to capture kwargs) covering 1D/2D branching, 2D **and** 1D posterior normalization, orientation auto-detection/preference (including the explicit-honored path and both warnings), and the 1D `linear_position` extraction.
- `tests/decoding/test_decoding_utils.py` — direct unit tests for `resolve_orientation_col` (requested-name honored, `"orientation"` preference, `"head_orientation"` fallback, `None` when absent, and the `orientation_name=None` default the v1 methods rely on).

## Verification

- `tests/decoding/test_decoding_utils.py` + `tests/decoding/test_create_decoding_view.py` — **17 passed** locally against a real MySQL (Colima).
- Orientation-refactor equivalence proven exhaustively (returned values **and** warning triggers) over every column subset × requested name, including `None`.
- `black` (26.5.1) + `ruff` (0.14.13) clean.
- Reviewed with the pr-review-toolkit agents (code / tests / comments / errors); the follow-up coverage gaps they flagged are addressed above. One pre-existing, non-blocking observation — zero-mass posterior bins normalize to `NaN` (also true on the pre-existing 1D path) — is left as-is by decision.
- Merged latest `master` (resolved a trivial `CHANGELOG` conflict); no remaining conflicts.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61e7fd4615f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.