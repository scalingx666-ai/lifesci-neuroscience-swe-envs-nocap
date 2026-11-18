# Issue

**Title:** ErpCore2021: read the recordings from NEMAR's BIDS deposit nm000132 by task

## Description

Under the default `"auto"` provider, the seven `ErpCore2021_*` classes contacted NEMAR for `nm000132`'s `sourcedata/`, found none (`SelectionError: No files matched the BIDS query: scope=sourcedata`), warned, and downloaded every recording from OSF (`files.de-1.osf.io`). `nm000132` has no `sourcedata/` because it is the ERP CORE BIDS dataset itself.

**Deposit design (read-only, data.nemar.org).** Versions: v1.0.0 (2026-03-14), v1.1.0 and v1.1.1 (latest, 2026-04-04).
- One BIDS dataset, 40 subjects (`sub-001`..`sub-040`), no sessions.
- Tasks `MMN`, `N170`, `N2pc`, `N400`, `P3` and `flankers`. ERN and LRP are two analyses of the same flankers recording; upstream ships that recording twice, as byte-identical files under `task-ERN` and `task-LRP`.
- EEGLAB `.set` + `.fdt`, 30 EEG + 3 EOG channels (`HEOG_left`, `HEOG_right`, `VEOG_lower`), 1024 Hz.
- `sub-XXX_electrodes.tsv` and `sub-XXX_coordsystem.json` carry no task entity.
- Between v1.0.0 and v1.1.x only `README.md`, `dataset_description.json`, `participants.json` and the N170 `events.tsv` changed. v1.1 adds an `event_type` column; the loader reads `value` and `sample`.

**Change**
- `ErpCore2021.data_path` resolves the subject's BIDS root through `_subject_root`, in this order:
  1. a recording already in the NEMAR store;
  2. under `auto`, a local OSF copy (combined or legacy layout), reused without a request;
  3. NEMAR: `nemar_dl` with the class's task filter, plus `suffix=[electrodes, coordsystem]` for the subject-level sidecars that a task filter drops. The store `MNE-erpcore2021-data/nm000132` is shared by the seven classes, so ERN and LRP download the flankers files once;
  4. OSF, via the unchanged `download_by_subject`.
- `"upstream"` goes straight to OSF. Under `"auto"` a NEMAR failure falls back to OSF with a warning; under `"nemar"` it raises.
- `_prefetch_nemar_sourcedata` is a no-op, and `download()` fetches what `data_path` reads.
- `_get_single_subject_data` derives `events.tsv` from the BIDS path it already resolved, instead of resolving it a second time.

**Tests (offline):** `moabb/tests/test_erpcore2021_nemar.py`. Only `nemar.download` and the OSF downloader are replaced. The tests cover:
- the task per class (flankers for ERN/LRP) and the sidecar query;
- the shared store, and a reload without a request;
- `upstream` never contacting NEMAR;
- reuse of a local OSF copy;
- the `auto` fallback and the `nemar` failure;
- no sourcedata request, and `download()`;
- N170 labels unchanged by the `event_type` column.

**Equivalence: in progress. This PR stays a draft until the comparison with develop's OSF load is done.**

OSF has been down since about 18:23 UTC (osf.io answers 503, files.de-1.osf.io times out), so develop's OSF baseline could not be loaded yet. A Voyager Job is waiting for OSF and will then compare develop+`upstream` with this branch+`auto`: raw SHA-256, annotations, channels, `P300().get_data` X/y/metadata. Results so far (subjects 1 and 2, all 7 classes):
- **NEMAR files vs the md5 recorded in the OSF manifest** (`erpcore_manifest.csv`, Zenodo 14866307):
  - `eeg.fdt` is md5-identical for all 14 recordings, so the samples are byte-identical. The ERN and LRP OSF copies equal NEMAR's `task-flankers` file.
  - `events.tsv` is identical for ERN, LRP, MMN, N2pc, N400 and P3.
  - `channels.tsv` and `electrodes.tsv` are identical.
  - Differences: the N170 `events.tsv` (nm000132 v1.1 adds an `event_type` column; NEMAR has 80 face, 80 car, 80 scrambled-face and 80 scrambled-car stimuli for both subjects), `eeg.json` for ERN/LRP (task name), `coordsystem.json`, and the `.set` header (NEMAR's is saved as one `EEG` struct: 1024 Hz, 33 channels in the channels.tsv order, `pnts` matching the fdt). The OSF `.set` headers will be compared field by field once OSF is back.
- **Loads on this branch with `auto`:** every class loads for subjects 1 and 2, contacting only `data.nemar.org` (276 requests) and `nemar.s3.us-east-2.amazonaws.com` (228), with no OSF or Zenodo request. `P300()` epochs (30 EEG channels):

| class | subject 1 Target/NonTarget | subject 2 Target/NonTarget |
|---|---|---|
| ERN | 346 / 54 | 384 / 16 |
| LRP | 202 / 198 | 202 / 198 |
| MMN | 800 / 200 | 667 / 167 |
| N170 | 80 / 240 | 80 / 240 |
| N2pc | 160 / 160 | 160 / 160 |
| N400 | 60 / 60 | 60 / 60 |
| P3 | 40 / 160 | 40 / 160 |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfe5a5183a1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.