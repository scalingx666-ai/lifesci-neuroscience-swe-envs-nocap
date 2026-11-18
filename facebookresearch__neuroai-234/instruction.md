# Issue

**Title:** Fix Shirazi2024 (HBN) reaction time: stimulus-locked window and first-press label

## Description

Supersedes #205, . Carries @guptaishaan's original commit — the diagnosis and the config fix are theirs.

## Two bugs, not one

**1. The window was response-locked.** The task triggered on `Keystroke`, whose `start` is the button-press onset, so the realized window was `[press + 0.5, press + 2.5]` — entirely *after* the response. @guptaishaan's fix moves the trigger to the contrast-change `Stimulus`, giving `[stimulus + 0.5, stimulus + 2.5]`.

The competition start kit confirms this independently: `challenge_1.py` uses `ANCHOR = "stimulus_anchor"`, `SHIFT_AFTER_STIM = 0.5`, `WINDOW_LEN = 2.0`.

**2. Stimulus-locking exposed a second bug in the loader.** With the `Stimulus` as trigger, each trial yields one sample whose label came from `button_df.groupby("trial_num").max()` — the *last* press of the trial, not the response. Under the old `Keystroke` trigger this was invisible, because every press carried its own correct reaction time.

Measured on the full HBN contrast-change data (all 11 releases, 560,738 events):

| | |
|---|---|
| trials kept by the config | 114,099 |
| with >1 press after the target | 9,022 (7.9%) |
| mean label error on those | 0.93 s late (max 2.50 s) |
| label standard deviation | 0.35 s |
| implied nRMSE floor, R5 test split | **0.67** |

That last row is the point: against these labels, a model predicting the true reaction time perfectly would still have scored nRMSE ≈ 0.67 on the test split.

`.max()` was not arbitrary — 31,105 presses precede their trial's target and carry a negative reaction time, and a plain `.min()` over all presses would label trials at −2.05 s on average. But the challenge's own trial table filters on the sign *first* and then takes the first press: `eegdash.hbn.build_trial_table` restricts responses to `onset >= stim_onset` and selects `resp_block.iloc[0]`. This PR matches that. `is_correct` moves with it, from "any press in the trial was correct" to the first response's feedback, which is also what the challenge table reports.

## Verification

- `neuralfetch/test_shirazi2024hbn.py` — two data-free tests on a synthetic events TSV (multiple post-target presses; a premature press before the target). The first fails on the old code with `2.5 == 1.0`; the second guards the sign filter.
- The patched loader run over 57 real R5 recordings: all 1,128 labelled trials match the first post-target press computed independently; 80 (7.1%) would have differed under `.max()` by a mean of 0.74 s.

Answering @Roysegg's question from #205: arXiv:2506.19141 is unaffected, since it predates this config and comes from the competition's own pipeline. The NeuralBench paper's `reaction_time` entry for Shirazi2024/HBN does come from this config and is affected by both bugs.

## Docs

The EEG challenge tutorial inlines a copy of the task config that still said `Keystroke`, and `reaction_time.rst` left the window implicit in the embedded config. Both now state the stimulus-locked window. Also fixes a pre-existing typo in the tutorial (`neuralbench eeg reaction --prepare`, missing `_time`).

I removed @guptaishaan's `neuralbench/test_task_configs.py` entirely. Both tests in it failed on the old config only because a constant differed, not because anything computed a wrong answer: one asserted `start == 0.5` / `duration == 2.0` / `trigger == "Stimulus"`, which is the shipped YAML restating itself and gives the window a second home; the other ran `list_segments` but pinned only that a segment starts at `trigger.start + start`, which is `list_segments`' own contract and is already covered in `neuralset/test_segments.py`.

The `target.event_types` / `trigger_event_type` coupling was the one constraint there that a config cannot express alone. It belongs in the extractor as a validation error rather than a per-task test, and the string equality asserted was stricter than the real `isinstance` rule. The `neuralfetch` loader test stays, because it runs the real event-building code and fails on a computed value.

## Before the next release

Tracked in #235: the `Shirazi2024Hbn` event caches are stale and have to be deleted by hand (no config changed, so exca still hits them), and the published `reaction_time` numbers in `docs/_static/neuralbench-results-data.json` plus the paper figures need regenerating. That issue also records the `Study.version` gap this exposed.

## Checks

`ruff check` and `ruff format --check` clean. `neuralbench`: 265 passed (3 pre-existing `peft` import failures in `test_modules.py`, unrelated). Offline `neuralfetch` tests pass. `mypy neuralfetch`: 3 pre-existing `synapseclient` stub errors in `download.py`, untouched here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16e697b4cf31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.