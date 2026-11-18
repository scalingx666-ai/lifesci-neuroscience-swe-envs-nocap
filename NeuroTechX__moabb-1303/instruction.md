# Issue

**Title:** Zhou2016: read the BIDS release from NEMAR (nm000115) instead of Zenodo

## Description

Under the default `"auto"` provider, `Zhou2016` contacted NEMAR for `nm000115`'s `sourcedata/`, found none, warned, and downloaded the Zenodo `sub-N.zip` archives on every fresh load. The deposit has no `sourcedata/` because it *is* the loader's BIDS release: the same files as the Zenodo archives without their `desc-<hash>` entity.

**What NEMAR holds (read-only check, data.nemar.org):** one version, `v1.0.0` (2026-03-03), raw BIDS only: `sub-1..4/ses-{0,1,2}/eeg/*_task-imagery_run-{0,1}_eeg.edf` with `events.tsv/json`, `channels.tsv`, `eeg.json`, `space-CapTrak_electrodes.tsv/coordsystem.json`, and `ses-*_scans.tsv`. Compared with the members of the Zenodo zips (record 16534752), the EDF, `events.tsv`, `channels.tsv` and `electrodes.tsv` byte sizes are identical for all 4 subjects; `eeg.json`, `coordsystem.json` and `scans.tsv` differ (metadata enrichment), and the zip's `lockfile.json` is not in the deposit.

**Change**
- `Zhou2016` uses `OpenNeuroMirrorMixin` (the routing used by the loaders that read a raw BIDS mirror): `_download_subject` reads `nm000115` first unless the provider is `"upstream"`; under `"auto"` a NEMAR failure falls back to Zenodo with a warning, `"nemar"` makes it fatal. `nemar_bids_filters = {"scope": "raw"}` keeps the session-level `scans.tsv` (no datatype).
- A subject already fetched from NEMAR (all six runs with an EDF and `events.tsv`) loads without a request, as the Zenodo path already did.
- `get_data` no longer asks for `sourcedata/` (`_prefetch_nemar_sourcedata` is a no-op through the mixin); `download()` fetches what `data_path` reads.
- The mixin's fallback warning names the upstream host (`upstream_source`, `"Zenodo"` here instead of `"OpenNeuro"`).

**Equivalence (Voyager Job, first two subjects, fresh `MNE_DATA` per run, every request logged)**
- develop `e7f9fef` with `MOABB_DOWNLOAD_PROVIDER=upstream` vs this branch with `auto`:
  - raw data: SHA-256 of `raw.get_data()` identical for all 6 runs of subjects 1 and 2; same channel names and types, `sfreq`, `n_times`, `meas_date`, `subject_info`, digitization points, `bads`, filter settings and annotations
  - `MotorImagery().get_data`: identical `X` (SHA-256), labels and metadata. Subject 1: 479 epochs (feet 160 / left_hand 160 / right_hand 159). Subject 2: 435 epochs (145 / 145 / 145).
- Hosts contacted on the branch run: `data.nemar.org` and `nemar.s3.us-east-2.amazonaws.com` only. develop contacted `zenodo.org`.

**Tests (offline):** `moabb/tests/test_zhou2016_nemar.py`. Only `nemar.download` and the Zenodo access are replaced; provider routing and the BIDS path search run for real. The tests cover:
- the NEMAR read under `auto`
- a second load without a request
- refetching an incomplete subject
- `upstream` never contacting NEMAR
- the `auto` fallback and the `nemar` failure
- no sourcedata request

`test_zhou2016.py::test_download_subject_repairs_incomplete_subject_dir` now pins `upstream`, because it tests the Zenodo repair path.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33d9c981a45c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.