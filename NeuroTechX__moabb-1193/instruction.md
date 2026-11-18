# Issue

**Title:** Add MI archive datasets: Brodu2012, IMUMIA2026, Leeuwis2021, MartinezPeon2024 and PardoGarcia2026

## Description

## Summary
Port five existing dataset implementations from the MI expansion branches onto current develop (18e7d4c03): Brodu2012 (was OpenViBE), IMUMIA2026 (was Li2026), Leeuwis2021, MartinezPeon2024, PardoGarcia2026. All five loader files are identical between `codex/mi58-corrected-20260801` and `bruaristimunha-fork/codex/mi-dataset-expansion`; no conflicting scientific variant was silently chosen.

- Register classes, API docs, summary CSV and every cited DOI; migrate acquisition channel counts to current channel_types conventions.
- Leeuwis: fix inclusive final-trial endpoint to 4.996 s; annotate stored-window joins and preserve EDGE boundary through annotation reconstruction. Synthetic independent-window filtering regression.
- Li: numeric subject sorting (01,50,100,150,200), archive transport/missing-task checks, synthetic Curry float32/sidecar regression.
- MartinezPeon: propagate verbosity; synthetic SI scaling and first/last cues. Correct summary total to 300 (not multiplied by run count again).
- OpenViBE: support both reference-header spellings; synthetic CSV event/scaling test. Remove inherited fake EXEMPT ID.
- PardoGarcia: preserve genuine missing-post sessions, repair stale BrainVision sibling reference without overwriting originals, retain restricted pre-execution window. Remove inherited fake EXEMPT ID. Summary per-subject mean is protocol-derived across available sessions, not a measured inventory.

## Draft blockers — do not merge
1. **No verified NEMAR/OpenNeuro mirror ID/version for any of these five.** Inspected public nemarDatasets repository metadata (787 repositories) and OpenNeuro name searches; no matching identity found. This is discovery evidence, not proof no unindexed/private mirror exists. No ID was fabricated and no exemption/pending entry was added. The existing NEMAR validation intentionally still fails for these five. Original upstream transport remains; no rehost/publication occurred.
2. **Real-data validation pending**: no recordings downloaded and no Voyager jobs/paper reruns launched in this port. Synthetic tests validate code behavior, not scientific provenance or source calibration.
3. **Li2026 laterality and timing**: numeric code-to-side mapping inferred from documented condition ordering, not an explicit codebook; imagery onset relative to cue needs confirmation. Legacy fallback assumes float32 microvolt payload and does not recover physical electrode coordinates. Native-reader/fallback parity needs real source evidence.
4. **PardoGarcia2026**: image-locked preparation/imagery cannot be certified as pure MI solely by ending before a go cue. Verify instructions and earliest go cue across all sessions; labels and acquisition semantics remain scientific review gates.
5. **OpenViBE**: 14 records are currently exposed as subjects; independent participant identities must be established before cross-subject conclusions. Verify Event Date vs CSV row alignment and source physical units.
6. **MartinezPeon2024**: fixed protocol-derived cues rather than recorded markers, recording/block-level force classes and source units require independent verification; avoid claiming acquisition-block-independent decoding.
7. **Leeuwis2021**: source units, retained counts and all released timestamp windows require real-file confirmation.

## Verification
All tests use explicit PYTHONPATH pointing to this worktree (verified moabb.__file__), isolated _MNE_FAKE_HOME_DIR, existing MNE_DATA and MOABB_DOWNLOAD_PROVIDER=auto. No signal downloads.
- Synthetic loaders + metadata + cached DOI + preprocessing: **1099 passed, 358 skipped, 152 deselected**.
- Bounded dataset suite: **1152 passed, 103 skipped, 337 deselected**.
- Genuine missing-ID gate: **5 failed**, one per added loader; not suppressed in repository tests.
- Touched-file pre-commit: passed after formatting.
- Excluded local network/real-data paths: download-marked tests, test_epochs, test_dataset_accept, four session-filtering tests with potential inherited prefetch; live test_dois_resolve. Missing-ID tests run separately, as above.

Draft only; no merge or all-green CI claim.

## Simplification (2026-09-29, head `ef9c8a702`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `e214e4ee2`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- Li2026 downloads through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check its ten develop callers use. The archive now extracts into `MNE-li2026-data/`, not next to the cached archive.
- PardoGarcia2026 reads BrainVision with `mne.io.read_raw_brainvision(..., overrides={"data_fname": ..., "marker_fname": ...})`, which replaces the header-rewriting `read_raw_brainvision_repaired`.
- Leeuwis2021 marks its trial joins with `mne.Annotations(onsets, 0.0, "EDGE boundary")` directly.
- Montage names are spelled `colin27_1005`/`colin27_1020` directly.
- Li2026's nested Curry sidecar parsers (`parameter`, `labels`) and its `sorted(key=lambda ...)` are now module-level private functions.
- The tests replace the nested `data_dl` recorder and every monkeypatched `lambda` with `Mock`, and read the call flags from `call_args_list`.
- **Nested functions/lambdas** added by this PR: 12 (3 nested defs, 6 patch lambdas, 2 argument lambdas, 1 sort key) → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 1289 → 1287; `moabb/tests/*.py` (net) 211 → 225. The test file grew because of the `Mock` call-argument assertions and the new `overrides` check.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint is identical apart from the recorded `data_dl` calls, where Li2026's one call now carries an explicit `fname=None`. It covers fake CSV/TXT/CSV.bz2/Curry archives through the real loaders, and pybv BrainVision files including one header with a stale `MarkerFile`.
- **Coverage** (pass 3 → pass 4): leeuwis2021 95→95, li2026 81→82, martinezpeon2024 92→92, openvibe 92→92, pardogarcia2026 100→100.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) ran 2555 passed and 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `47bde2c9b`)
- Li2026 extracts through `download_and_extract_zip`. With `force_update=True` it now also re-extracts; before, it only re-downloaded.
- PardoGarcia2026's own `_read_brainvision` is replaced by `read_raw_brainvision_repaired` (lenient mode). Its header-repair test moved to #1200.
- Leeuwis2021 uses `edge_boundary_annotations`.
- The `preprocessing.py` change is now owned by #1200.
- The montage calls in Leeuwis, MartinezPeon, OpenViBE and Pardo use `resolve_montage_name`.
- Two small loader tests were added (Pardo `_load_raw` channel/cue standardisation, Li2026 per-task cue labels). The moved code had been lowering these files' coverage.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1193`): `Leeuwis2021`, `Li2026`, `MartinezPeon2024`, `OpenViBE`, `PardoGarcia2026`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 1329 → **1289** (-3%); `moabb/tests/*.py` (net) 200 → **211** (+6%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): leeuwis2021 95→95, li2026 70→81, martinezpeon2024 92→92, openvibe 92→92, pardogarcia2026 83→100. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 2009 | 2009 | **1329** (-34%) |
| `moabb/tests/*.py` (net) | 254 | 201 | **200** (-21%) |

PR tests collected (pass 2): 12 → 13. Coverage of touched dataset files (pass-1 before → now, offline suite): leeuwis2021 89→95, li2026 67→70, martinezpeon2024 77→92, openvibe 88→92, pardogarcia2026 74→83, preprocessing 40→40.

### Pass 2 — loaders and tests
- 5 hand-written summary tables removed; compact channel lists; docstrings to MOABB's usual 1–2 paragraphs (all references/DOIs kept)
- Leeuwis `SUBJECTS` derived from the file-id table keys (55-line list removed); MartinezPeon file-id table one line per subject (ids unchanged), runtime `assert` in `_read_run` dropped (next line `set_montage(on_missing='raise')` already fails loudly)
- Li2026 four parallel task tables → one; OpenViBE `Ref_Nose`→`Nz` rename simplified (+1 two-case test for both header spellings), montage `try/except` dropped; Pardo single-use download helper inlined
- Kept on purpose: Li2026 Curry-less fallback reader and missing-task error, Pardo PAC03-POST header repair, all ids/URLs/events/intervals.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `test_li2026_regression.py`, `test_openvibe_regression.py`, `test_pardogarcia2026_regression.py` merged into `test_archive_b_regression.py`; the copied `dl.data_dl` recorder is now one helper (`_capture_transport`).
- Removed: `test_pure_imagery_window_precedes_overt_execution` (restated `interval`/`event_id`/rename table and grepped docstring strings — owned by `test_datasets.py` summary/metadata checks); the Leeuwis whole-raw-vs-per-crop filter comparison (verified MNE's EDGE handling, not moabb — the EDGE-survives-`SetRawAnnotations`, first/last cue and 2×1250-sample assertions stay); `test_pardo_missing_post_is_not_duplicated[11]` (same single-session path as patient 2); `preload/verbose` call-shape asserts in the fake reader.
- Tests collected 14 → 12; test LOC 254 → 201 (−21%). Coverage: leeuwis2021 89→89%, li2026 67→67%, martinezpeon2024 77→77%, openvibe 88→88%, pardogarcia2026 74→74%, preprocessing 40→40%. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab708a630562`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.