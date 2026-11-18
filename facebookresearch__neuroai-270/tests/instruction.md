# Issue

**Title:** neuralfetch: fetch Sleep-EDF from PhysioNet's S3 mirror, and correct REVE's access docs

## Description

## What does this PR do?

Two things the EEG/EMG Foundation Challenge 2026 starter kit gets wrong today: it asks entrants to register for REVE's weights, which are no longer gated, and it points Track 3 at a download host that is ~600x slower than the mirror we already use elsewhere.

### REVE's checkpoints are public

The Hub reports `gated: false` for `brain-bzh/reve-base`, `reve-large` and `reve-positions`, and serves `model.safetensors` over an anonymous `GET` (HTTP 200, no token). The account / licence / token instructions added in #256 are therefore dead ends for entrants, so they come out of `install.md` (the `pretrained-weights` section stays, since three pages link to it), the REVE model page, the quickstart tutorial, `pretrained_weights/README.md`, and the step-4 debug blurb on Tracks 1-3. Those steps keep the `-m reve --debug` check — worth doing before queueing — but on the honest rationale: the first build needs network access, not an account.

### Sleep-EDF comes off the S3 mirror

`Kemp2000Analysis` fetched through `mne.datasets.sleep_physionet`, i.e. the `physionet.org` web host. Measured throughput:

| Host | Throughput | Implied time for the corpus |
| --- | --- | --- |
| `physionet.org` | 51 KB/s | ~38 h |
| `physionet-open` S3 (8 workers) | 31 MB/s | ~4 min |

So the Track 3 page's "~8 GB, minutes rather than hours" was wrong by about two orders of magnitude on the one track we recommend starting with. `neuralfetch` already has the `download.Physionet` S3 backend and both sibling PSG studies (`Alvarez2022Haaglanden`, `Ghassemi2018You`) use it — this study is simply brought in line, with `include=["sleep-cassette"]` so it stops pulling the `sleep-telemetry` cohort `iter_timelines` never reads (7.07 GiB of 8.12 GiB; the 306 cassette objects are exactly the 153 recordings the study yields).

**Behaviour change worth flagging:** recordings land under `download/sleep-edfx/1.0.0/sleep-cassette/` instead of `physionet-sleep-data/`, so an existing copy is re-downloaded once. At ~4 minutes that seemed better than carrying a path-compat shim, but happy to add one.

### Every track opens with a cheaper way in

Task defaults are untouched, so no published number moves; the pages just lead with the cheap option instead of a multi-hundred-GB download.

| Track | Default | Cheap entry point |
| --- | --- | --- |
| 1 — Image | `Gifford2022Large`, ~220 GB | `--dataset xu2024alljoined`, ~25 GB |
| 2 — BCI | `Stieger2021Continuous`, ~940 GB | `--dataset tangermann2012`, <1 GB |
| 3 — Sleep | `Kemp2000Analysis`, ~7 GB | none needed |
| 4 — EMG pose | `Salter2024Emg2pose`, ~330 GB | `--download --debug`, 3 subjects of 193 |

Track 2 already documented `tangermann2012`, but at the *end* of the page, below the 940 GB command — it is now a tip above the commands. Track 4 ships no dataset variants; `_apply_debug_overlay` sets `data.study.source.query` before `_download_dataset` runs, and `Salter2024Emg2pose._download` narrows to the subjects a query names, so `--download --debug` is a real shortcut there and is documented as one.

## Related Issues

None.

## Checklist

- [ ] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [x] `pytest` and `mypy` pass locally

No test is added: the change swaps one download backend for another, which the suite covers only behind network-gated tests that skip by default. Verified manually instead — a scoped S3 download, then `iter_timelines` yielding the right subject/session/suffix, `_get_filenames` resolving both EDFs, and `_load_raw` returning 100 Hz data with the expected channels. `ruff check` / `ruff format` are clean repo-wide and `neuralfetch`'s download and study tests pass (62 passed, 140 skipped). `mypy neuralfetch` reports one pre-existing `eegdash` stub error in `download.py`, untouched here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2906ffcf2fa2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.