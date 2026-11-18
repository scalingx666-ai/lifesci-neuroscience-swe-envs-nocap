# Issue

**Title:** Restore HefmiIch2025 nemar_id (nm000347 v1.0.5) and enrich Brodu2012/Wang2026Handwriting/Yagan2023 metadata

## Description

### Summary
- **`HefmiIch2025` (`nm000347` v1.0.5)**: Now that `nemardatasets/nm000347` PR #5 is merged and `v1.0.5` is live on `data.nemar.org` with all 98 EEG epoch files re-filed under the depositor's folders (`sub-01`..`sub-37`, `sourcedata/epo_data/{Normals,Patients}/EEG/subject<N>/<k>_epo.mat`), restore `nemar_id = "nm000347"` and `nemar_subject_template = "{subject:02d}"` on `HefmiIch2025` and add offline store-resolution coverage in `test_hefmi_ich2025.py`.
- **`Brodu2012` (`nm000366`)**: Set `DocumentationMetadata.license = "LGPL-2.1-or-later"` (matching the OpenViBE license under which Dataset #1 was distributed by Inria).
- **`Wang2026Handwriting` (`nm000466`)**: Record `ethics_approval` (`KMUST-MEC-2023-026`, Kunming University of Science and Technology Ethics Committee) in `DocumentationMetadata`.
- **`Yagan2023` (`nm000569`)**: Record `ethics_approval` (Sabancı University human-subject informed consent statement) in `DocumentationMetadata`.
- **`moabb/tests/test_datasets.py`**: Remove `HefmiIch2025` from `NEMAR_ID_EXEMPT` and update the status comments for the 7 deposits currently in `Status: requested` on NEMAR (`nm000331`, `nm000332`, `nm000333`, `nm000337`, `nm000366`, `nm000466`, `nm000569`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5eab0b6c473`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.