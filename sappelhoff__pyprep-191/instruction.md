# Issue

**Title:** Run PREP in stages (backward-compatible), reviving #99

## Description

# PR Description

- 
- 

This implements PREP-in-stages and optional final interpolation, **fully backward compatibly**. It revives and modernizes the work in the now-closed #99 by @a-hurst — this PR **supersedes #99** (which could not be merged: it was based on 2021-era code, carried breaking changes, and was never finished).

Credit: the two core commits are cherry-picked (with `-x` provenance) from Austin Hurst's original branch, preserving him as their git author; the remaining commits carry `Co-authored-by: Austin Hurst` trailers.

## What's new (all additive)

- `PrepPipeline.remove_line_noise(line_freqs=None)` and `PrepPipeline.robust_reference(max_iterations=None, interpolate_bads=True)` — the individual PREP stages that `fit()` runs in sequence. Running them manually is identical to `fit()` (verified by a test).
- `interpolate_bads=False` on `robust_reference()` (and `Reference.perform_reference()`), plus a standalone `Reference.interpolate_bads()` building block, to skip the final bad-channel interpolation and inspect/handle the bads yourself.
- `robust_reference()` emits a `UserWarning` if line-noise removal wasn't done first (suppressed inside `fit()`, including the empty-`line_freqs` case).

## Backward compatibility

This is the central design constraint:

- `fit()` is **byte-identical** to before (verified: a manual staged run equals `fit()`).
- **No** public attribute was renamed or removed (`EEG_new`/`EEG_clean`/`EEG`, `noisy_channels_*`, `bad_before_interpolation`, `still_noisy_channels`, `reference_*`, `interpolated_channels` all unchanged).
- `filter_kwargs` semantics preserved (e.g. `method="fir"` still works) — the existing `test_prep_pipeline_filter_kwargs` and the full `test_matprep_compare.py` MATLAB-strict suite pass unchanged.

A latent bug in the original #99 guard was also fixed: it raised when robust referencing found *zero* bad channels (an empty list); the guards now use `is None` sentinels.

## Intentionally deferred (out of scope, would be breaking)

The more ambitious parts of #99 are **not** included here, to keep this PR non-breaking. If wanted, they should go through an explicit deprecation cycle later:

- folding the loose `noisy_channels_*` / bad-channel attributes into `noisy_info` / `bad_channels` dicts;
- `get_raw(stage=...)` and the `current_*` getters;
- dropping notch-filter methods other than `spectrum_fit`.

## Tests / docs

- New tests: staged == `fit()`; `interpolate_bads=False` path; the out-of-order warning fires/doesn't; `Reference.interpolate_bads` guards. Existing tests pass unchanged (the BC proof).
- New gallery example `examples/run_prep_in_stages.py`.
- Changelog entry under 0.7.0.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd11a2c5be7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.