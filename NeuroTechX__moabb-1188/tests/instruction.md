# Issue

**Title:** Add NETBCI2026 longitudinal motor-imagery dataset (Networks for BCI)

## Description

## Summary
Add `NETBCI2026` (Networks for BCI, formerly `Corsi2026` in this PR): 19 participants × 4 longitudinal sessions × 6 feedback runs, 74 EEG channels, right-hand motor imagery versus rest, with a [0, 5] s epoch window.

- Paper: https://doi.org/10.1038/s41597-026-08237-5
- Released data: https://doi.org/10.57745/RBJRC7, version 2.2, CC-BY 4.0.
- Registers the loader, metadata, imagery summary, API docs and cached DOIs.
- Uses the released EEG/BrainVision representation and authoritative BIDS events, replacing rather than duplicating native annotations. This is the authors' released/processed representation, not an assertion of untouched acquisition data.
- Fetches only a subject's EEG members from the 49 GB EEG+MEG ZIP64 archive via HTTP ranges, with presigned-URL refresh, pinned archive identity/size, root-file MD5 checks and per-member CRC checks. Does not download the full archive or MEG; full-archive MD5 cannot be recomputed from partial retrieval.
- Normalizes the genuine off-rate recordings to 250 Hz while preserving annotation times: 440 runs at 250 Hz, 10 at 249.9 Hz and 6 at 1000 Hz in the release.

## Validation
- Final-source local gate in an isolated MNE home: **2233 passed, 618 skipped** across dataset, metadata and DOI suites. Explicit exclusions: live DOI resolution, real-data `TestData.test_epochs`, and licence/data-access `test_dataset_accept`; download/slow defaults remain disabled. The prior Lee2024 failure with the normal laptop configuration does **not** reproduce in this isolated gate.
- All touched-file pre-commit hooks pass; synthetic coverage includes transport/member CRC, root-file checksums, event replacement, staged-data reuse and both off-rates.
- Voyager job `moabb-smoke-corsi2026-09282020`: Kubernetes **Complete**, all **19 subjects / 456 runs** processed. The tested paradigm produced uniform 74 × 641 arrays and **14,430 epochs** (7,224 imagery / 7,206 rest).
- The released event tables contain **14,431 events**. Sub-03/ses-01/run-03's last rest cue is at 224.03 s but recording ends at 227.69 s. Its full five-second epoch cannot be extracted. The original smoke assertion compared against all released events, so subject 3 reports a count-only failure; the other 18 subjects pass all assertions. A separate full-inventory duration audit found exactly this one truncated trial. We retain the original logs rather than relabel the original assertion as passing.
- Voyager tested loader MD5 `220874b9af5c57b1671853152330bae0` (20:20 source snapshot). Subsequent local changes make BOM handling explicit and document truncation; final synthetic gates additionally cover 1000 Hz. The final committed loader has not been rerun over all real data.

## Scientific limits / remaining gate
- **Draft:** a NEMAR mirror is not yet assigned/published; the temporary test exemption explicitly documents this. Rehosting/public retrieval is outstanding, not implied by this PR.
- Offline CSP-LDA diagnostics are not a reproduction of the paper's online task: session means 68.6/73.9/80.4/78.5% versus online 54.1/56.7/62.2/68.7%; across 76 subject-sessions Spearman rho=0.09, p=0.44. No claim of equivalent protocol or scores.
- Participants metadata agree with the paper's Table 1, but our session-4 non-controller count is 4 versus the paper's 2; the criterion is not resolved. Keep that comparison qualified.
- No paper benchmark reruns or dataset publication are part of this change.

## Simplification (2026-09-29, head `5498ae8c2`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `e42a2548f`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops `resolve_montage_name`.
- The montage name is spelled `colin27_1005` directly.
- `_subject_members` filters with a plain loop, not a nested `keep()`, and sorts with `operator.attrgetter("header_offset")`.
- The tests replace the monkeypatched `lambda`s and the `SimpleNamespace` lambdas with `Mock`. The reader test also asserts which file was read.
- The HTTP range reader stays: the per-subject EEG sits inside one 49 GB zip, so this is not a whole-archive download that `download_and_extract_subject_zip` could handle.
- **Nested functions/lambdas** added by this PR: 9 → **0** (1 nested def, 5 lambda-patch, 2 lambda-arg, 1 lambda-key).
- **LOC added** vs #1200: `moabb/datasets/*.py` 476 → 477; `moabb/tests/*.py` (net) 117 → 120.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (a fake range-served archive through the real loader) is fully identical.
- **Coverage** (pass 3 → pass 4): corsi2026 54→56.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2508 passed and 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `fbfad6b89`)
- The Corsi2026 montage uses `resolve_montage_name("colin27_1005")`. The range reader is untouched (it is not a zip download).
- **NEMAR:** none (Corsi2026 was already in `NEMAR_ID_EXEMPT`). `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 476 → **476** (+0%); `moabb/tests/*.py` (net) 117 → **117** (+0%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): corsi2026 54→54. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 569 | 569 | **476** (-16%) |
| `moabb/tests/*.py` (net) | 187 | 178 | **117** (-37%) |

PR tests collected (pass 2): 7 → 6 (PR tests in `test_datasets.py`). Coverage of touched dataset files (pass-1 before → now, offline suite): corsi2026 55→54 (missed lines 94→75; % dips only because statements were deleted).

### Pass 2 — loaders and tests
- hand-written summary table removed; docstring prose 51→25 lines
- range reader: unused byte/request counters and their log line dropped, `seek` → dict lookup, `readinto` reuses `read_range`
- single-use `_build_annotations` inlined; never-hit missing session/run fallbacks removed; `_subject_members` takes zip entries only (string branch was test-only)
- tests: events-replace + off-rate resample merged; subject-members test rebuilt on real zip entries (also checks archive order)
- Kept on purpose: range fetch, presigned-URL refresh (expiry + retry), retry/backoff, size/signature/CRC-32/MD5 checks and all their tests, stored+deflated reader tests; `NEMAR_ID_PENDING` untouched.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.

### Pass 1 — test audit
- The two Corsi2026 run-loading tests now share one staging helper (`_corsi2026_run`) instead of duplicating the vhdr/events.tsv/`bids_paths`/`read_raw_brainvision` setup.
- Off-rate resample regression runs once at the observed 249.9 Hz rate; the 1000 Hz variant exercised the same resample branch and the same event-timing assertion. Corsi2026 tests collected 8 → 7; `test_datasets.py` additions 187 → 178 lines.
- Retained on purpose: `_subject_members` selection (49 GB archive; only owner of the EEG/MI-only rule), ZIP range reader CRC check (stored + deflated paths differ), staged-subject no-network, MD5 check, events-replace-markers regression.
- Coverage: `corsi2026.py` 55→55% (offline). Proof: same offline coverage command as #1186 (2381 → 2380 passed, 0 failed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `868dce9ce9eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.