# Issue

**Title:** Add a public SpectralTransform protocol for custom transforms

## Description

## Summary

Part of the post-#79 cleanup PRs. `Connectivity.from_transform` accepted `transform: Any` and discovered what a transform provides through `getattr`. This PR adds `SpectralTransform`, a public, `@runtime_checkable` `typing.Protocol` exported from `spectral_connectivity`, which documents that contract. `from_transform` and `Connectivity` now also reject custom-transform input that used to give silently wrong results.

### The protocol
- **Required:** `fft()`, returning `(n_time_windows, n_trials, n_tapers, n_fft_samples, n_signals)`; `frequencies`; `time`.
  - `frequencies` and `time` are typed `... | None` because `Connectivity` accepts `None` for both.
  - Plain attributes, properties and cached properties all satisfy the protocol.
- **Optional, with unchanged defaults:** `is_one_sided` (False), `observation_weights` (None), `observations_are_independent` (True), `time_bins_are_independent` (True).
  - `typing.Protocol` can't express optional members, so they are documented in the protocol's docstring.
  - They are read by a helper that lets an `AttributeError` raised *inside* a property propagate, instead of taking it for the attribute's absence.
- **The docstring is the single full statement of the contract.** The README, cookbook and `from_transform` point to it. It covers:
  - **Ownership:** `fft()` must return a new array on each call, and nothing may modify it afterwards. Read-only marking is only a safeguard: views made beforehand stay writable, and CuPy has no read-only flag.
  - **Scaling:** which coefficient scaling makes `power()` a density, for two-sided and one-sided transforms. `power()` is the only measure that depends on it. A new test checks both recipes by Parseval.
- **Typing:**
  - `from_transform` and `from_multitaper` are annotated with the protocol.
  - A `TYPE_CHECKING` block makes mypy verify that `Multitaper`, `ShortTimeFourierTransform`, `Welch` and `MorletWavelet` satisfy it. CI runs mypy on `src/` only, which is why the check lives there.
  - The stub members have docstring-only bodies, so they don't count as uncovered lines.

### Input that used to give silently wrong results
None of these are new in this PR. Master behaves the same way, but publishing the protocol makes the mistakes easier to make.

| Input | Before | Now |
|---|---|---|
| Two-sided frequencies not in `numpy.fft.fftfreq` order, e.g. `rfft` output without `is_one_sided`, or an `fftshift`ed spectrum | Half the band was dropped and power was 1.6× too high | `ValueError` from `Connectivity` itself |
| Real-valued `fft()` output | PLI, imaginary coherence and coherence phase were exactly 0 | `TypeError` from the coefficient setter |
| `is_one_sided` / independence flag set to a method, `"False"`, `None` or `0`, whether on a transform, in `Connectivity(...)` or in `fourier_connectivity` | `bool()` read a method or `"False"` as True, and `None` or `0` as False | `TypeError` naming the flag. One `_validated_flag` serves all three entry points and accepts Python bools, NumPy bools and 0-d boolean arrays (e.g. `xp.all(...)`). `from_transform` checks the flags before calling `fft()` |
| `AttributeError` raised inside a capability property | The default was used silently | The error propagates |

The FFT-order, complex-dtype and flag checks existed only in `fourier_connectivity`, with a different tolerance and exception type from the checks I first added to `from_transform`. Each now lives in one place, in `Connectivity`, and the wrapper's copies are removed. `fourier_connectivity` behaves the same: the same error wording, and still a `TypeError` for real-valued coefficients.

The FFT-order check allows for the coordinate's own float precision (never looser than 1e-9), so float32 frequencies from netCDF pass, and an empty coordinate is skipped.

## Compatibility

- **Runtime for valid input:** unchanged. No new attributes are required, and the defaults are the same.
- **Stricter validation (intended):** direct `Connectivity(...)` calls now reject two-sided frequencies that aren't in FFT order, and real-valued coefficients. `Connectivity`, `from_transform` and `fourier_connectivity` reject non-boolean flags, including `0` and `1`, which were accepted before.
  - One existing test, `test_group_delay_stable_for_large_frequency_offset`, labelled a two-sided spectrum with offset frequencies `1e6 + k·0.001`. It now uses a one-sided spectrum. The raw-moment variance still cancels to exactly zero, so the test still checks what it was written for.
- **Static typing:**
  - Mistyped custom transforms passed to `from_transform` or `from_multitaper` now get mypy errors, where they used to be accepted as `Any`.
  - A `Connectivity` subclass that overrides `from_multitaper` with a `Multitaper` annotation must widen it to `SpectralTransform`.
- **Python 3.10/3.11:** `isinstance` against the protocol evaluates the `frequencies` and `time` properties, so it can raise if they do. Python 3.12+ uses `getattr_static`. This is noted in the docstring.

## Decision: fft() ownership

`from_transform` takes ownership of `fft()`'s output without copying and marks that array (and its base chain) read-only where the backend allows. **Decided: keep zero-copy and document the contract** rather than copying custom transforms' output.

A transform's own array is frozen before the constructor's frequency checks run, so it stays read-only even if construction then fails.

Also out of scope: `connectivity_to_xarray` needs the private `_provenance_metadata()`. Custom transforms therefore work with `from_transform` but not with `connectivity_to_xarray`, so that function's parameter stays `Any`.

## Test plan

- [x] `tests/test_spectral_transform.py` (43 tests):
  - the protocol is exported, and the built-ins satisfy it;
  - an object missing any one of the three required members does not satisfy it;
  - documented defaults, honored optional attributes, and `None` frequencies and time for both sidedness cases;
  - forwarding of `dtype` and the Wilson options;
  - NumPy-bool and 0-d boolean-array flags are accepted, and method, string, `None` and int flags are rejected, before `fft()` runs;
  - an `AttributeError` inside a property propagates;
  - FFT-order and complex-dtype rejection, through both `from_transform` and direct construction;
  - the scaling recipes, checked by Parseval for even and odd lengths.
- [x] `tests/test_connectivity_state.py`: the constructor's flag checks, the FFT-order check at float32 and float64 for 64, 3000 and 3001 bins (including a near-miss grid that must fail), and an empty coordinate. `tests/test_wrapper.py`: `fourier_connectivity` rejects a non-bool `is_one_sided`.
- [x] Mutation checks: removing each forwarded option, the frequency or time forwarding, the protocol's `frequencies` member, or the one-sided √2 factor each fails a test.
- [x] Full suite: 1510 passed, 15 skipped. Doctests (65), ruff, mypy and codespell are clean. The `-p no:warnings` run passes.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d327fa170db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.