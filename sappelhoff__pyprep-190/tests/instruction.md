# Issue

**Title:** FIX: fetch test recording via MNE eegbci loader; resilient package downloads

## Description

/ #160. The new `matprep_artifacts` workflow failed on its first run on `main`, which also red-failed `Python tests`.

## Root cause

`tools/matprep/config/pipeline_setup.py` downloaded the test EEG (`S004R01.edf`) with a single raw `urlopen` — no timeout, no retry. On the CI run it hit a transient runner→PhysioNet **TCP connection timeout** (`Errno 110`, ~135s — the IPv6-route-blackhole signature on GitHub runners) and aborted the whole build. No artifacts were produced, so the rolling `matprep-artifacts` release was never published, which in turn 404s the downloads in `tests/test_matprep_compare.py`.

## Fix

**Fetch the recording via `mne.datasets.eegbci.load_data` instead of a raw download.** It is pooch-backed (retries + verifies the bytes against MNE's hash registry) and pulls from the *same* PhysioNet source (`physionet.org/files/eegmmidb/1.0.0/`) that the rest of pyprep's test suite already uses — so it's the identical file, fetched the same robust way. The workflow now `pip install`s `mne`; mne is used **only** to fetch the recording (MATLAB PREP still does all the processing, so the mne version has no effect on the artifact values).

The **EEGLAB/PREP archives** have no dataset fetcher, so they keep a small `download()` helper (bounded per-attempt timeout + retries with backoff + a real `User-Agent`) — a momentary blip on those hosts won't hard-fail the build either.

## Verification

- Ran the actual data-fetch path locally: `eegbci.load_data(4, 1)` → copies `S004R01.edf` at the exact expected 1,275,936 bytes, from the same PhysioNet URL.
- `pre-commit` (incl. `check-yaml` on the workflow) + `ruff check`/`ruff format` clean.

## After merge

The merge commit touches `tools/matprep/**`, so it auto-triggers `matprep_artifacts` again. This is the first run that will exercise the MATLAB install / PREP run / release-publish steps (the download killed earlier runs before that). Once it's green it publishes the `matprep-artifacts` release; the parallel `Python tests` job on the same commit will likely still 404 on that first pass, so re-run it once the artifact build is green. Self-sustaining thereafter.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e30e9b94453`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.