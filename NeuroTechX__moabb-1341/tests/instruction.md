# Issue

**Title:** Cho2017: demean each trial block by its own fixation period, document the per-class tiled layout

## Description

## What this changes

Closes part of #1340 (items 1 and 2 of the proposed fix; the paradigm warning, item 3, is left out of this PR).

The GigaDB files store each class as one stream of 100 (or 120) tiled 7-s blocks: 2 s of fixation, the cue, then 5 s. `Cho2017._get_single_subject_data` removed the mean of each class stream as a whole. In participants with a sustained eye movement toward the imagined hand after the cue, that mean differs by class, so the pre-cue segment of every trial got a class-dependent offset of about half the post-cue step, with the opposite sign.

1. `moabb/datasets/gigadb.py`: a small helper `_demean_blocks` removes from each block the mean of its own fixation period. Block boundaries come from `imagery_event`: the first cue sample is also the fixation length of every block. The stacking (left stream, 500 zeros, right stream), scaling, events and channel layout are unchanged.
2. `Cho2017` docstring: a new **Data layout** section. It says the trials are per-class tiled streams, that the per-block demeaning makes the unfiltered pre-cue segment class-neutral, and that with `fmin` below a few Hz the band-pass filter itself spreads the post-cue deviation into the pre-cue samples. It recommends the default `fmin` or a pre-cue `baseline` (e.g. `baseline=(-1, 0)` with `tmin=-1`). The existing `log.warning` points to this section.
3. `moabb/tests/test_cho2017_baseline.py`: an offline test. It builds a tiny synthetic per-class tiled file (68 channels, 10 blocks per class, a class-locked step after the cue, a random DC level per block), monkeypatches `loadmat` and `data_path`, and checks that after the loader every block's fixation period is zero-mean in both classes and the post-cue class difference is kept. It also checks that the former per-stream demeaning gave the pre-cue segment a class-dependent offset. The test fails on `develop` and passes with this change.
4. `docs/source/whats_new.rst`: Bugs entry.

## What does not change

- No default band, interval, baseline or paradigm behaviour is changed. `LeftRightImagery()` / `MotorImagery()` (8-32 Hz, 0-3 s) return identical data: subject 5 values below are the same before and after.
- No change to `moabb/paradigms/`. No new dependency.
- Users with `fmin=None` get different (cleaner) data. Their pre-cue segment loses the class offset, and slow block-to-block DC steps are removed.

## A correction to the issue

The issue said the per-block demeaning would remove the class offset "for users with no / very low high-pass". It only does so for `fmin=None`. A 0.1-Hz high-pass removes the mean of the periodic block pattern ("flat, then deviation to the end of the block") whatever the loader did before. So the 0.1-Hz offset comes back at almost the same size. The 0.5-Hz pre-ringing also stays, as the issue already said. For those cutoffs the docstring note (and a pre-cue baseline or a higher `fmin`) is the remedy, not the loader.

## Numbers (subject 5, `repro_issue.py` from the issue plus `fmin=None` and 1-40 Hz)

`LeftRightImagery(fmin, fmax, tmin=-1.0, tmax=3.0)`. F8-F7 mean over the second before the cue (file units), and 5-fold LDA accuracy on that single feature. Before = `develop` @ `bed9f0fa`, after = this branch.

| fmin-fmax | pre-cue R-L before | pre-cue R-L after | pre-cue LDA before | pre-cue LDA after | post-cue (1-3 s) LDA before / after |
|---|---|---|---|---|---|
| None (no filter) | -4313.0 | +7.3 | 0.500 | 0.485 | 0.500 / 0.995 |
| 0.1-100 | -4209.7 | -4104.6 | 0.965 | 0.995 | 0.990 / 0.995 |
| 0.5-100 | +529.8 | +520.7 | 0.955 | 0.980 | 0.800 / 0.810 |
| 1-40 | -6.3 | -4.8 | 0.450 | 0.405 | 0.940 / 0.940 |
| 8-32 (default) | -0.5 | -0.5 | 0.480 | 0.480 | 0.505 / 0.505 |

With no filter the pre-cue LDA was already at chance before the fix, because slow drift between blocks does not generalise across folds. The fix removes the -4313 offset itself, and the same drift removal lets the real post-cue signal decode (0.500 to 0.995).

## Checks

- `pre-commit run --files` on the three changed files: all hooks pass (ruff, ruff-format, codespell, whitespace).
- `pytest moabb/tests -k "Cho2017 and not test_download"`: 22 passed, 4 skipped (need `--dl-data`, plotly, optuna, or have no second DOI to compare).
- `pytest moabb/tests/test_cho2017_baseline.py test_metadata.py test_summary_trials.py test_dataset_metadata_regressions.py test_compilation.py`: 696 passed.
- The new test fails on the unpatched loader.

Possible follow-ups, not in this PR: the paradigm warning (item 3 of #1340), and docstring notes for `Weibo2014`, `Wang2016`, `Nakanishi2015`, `Chen2017`, which also build their Raw from per-trial-demeaned blocks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57017db22e7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.