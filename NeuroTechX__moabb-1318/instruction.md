# Issue

**Title:** PerezBlanco2026, Wang2026, Han2026: read from their NEMAR deposits (nm000304, nm000335, on007327)

## Description

## What this changes

Three datasets that had no `nemar_id` now read from NEMAR:

| class | deposit | how |
|---|---|---|
| `PerezBlanco2026` | `nm000304` (published) | `nemar_id` + `nemar_seed_cache = True`: the deposit's `sourcedata/` holds every subject's extracted run EDFs under `sub-NN/eeg/`, where `data_path` looks before it queries figshare |
| `Wang2026` | `nm000335` (published) | `nemar_id` + `nemar_seed_cache = True` + `nemar_subject_template = "sub-{subject}"`: the deposit's manifest files each subject as `sub-<global id>`, so the default template matched nothing and every subject fell back to KiltHub |
| `Han2026` | `on007327` (NEMAR's import of OpenNeuro ds007327) | `OpenNeuroMirrorMixin`, `nemar_subject_template = "{subject:03d}"`; the import keeps the recording under `sub-NNN/eeg/` (OpenNeuro serves it at `sub-NNN/`) |

`PerezBlanco2026` leaves `NEMAR_ID_PENDING` (published on 14 Oct).

## Not changed (noted in the test bookkeeping)

Five deposits exist but are private, with publication denied. A class attribute would only make every load try NEMAR and fall back with a warning, so they stay in `NEMAR_ID_EXEMPT`, with their ids in comments, until they are published:
Brodu2012 `nm000366`, Lenaig2026 `nm000333`, MartinezPeon2025 `nm000332`, MIBMPI2024 `nm000331`, MIND2026 `nm000337`.
Yagan2023 and Wang2026Handwriting deposits were created later (private, unpublished) and stay exempt for the same reason.

## Checks

Live end-to-end on Voyager (subjects 1-2, fresh stores, `MOABB_DOWNLOAD_PROVIDER=nemar` vs `upstream`, all requests logged with sitecustomize netlog):

- NEMAR run contacted only `nemar.s3.us-east-2.amazonaws.com` / `data.nemar.org` (on007327, nm000335, nm000304 paths) — zero upstream requests.
- SHA-256 over every loaded run's data + annotations is identical between the NEMAR and upstream loads:
  - PerezBlanco2026 `e3bbc7ba7abd17cc6e5a4e6807bd68532014ea3495b072255e30718332d22bea`
  - Wang2026 `31da752d888b7f1ad34fa3b11f7bec4d659ed0dc06d921c15250817e818059b7`
  - Han2026 `16fb56d3aea77aa175724385ddab0b3e304e99cdf874c8e1727d77eef21a9261`
- The upstream run did hit figshare/OpenNeuro as expected, so the comparison is against the real upstream bytes.

Locally: targeted `test_datasets.py` nemar tests pass (10 passed, 2 expected skips for the still-undeposited Yagan2023/Wang2026Handwriting), `test_archive_a.py -k han` and `test_openneuro_batch2.py` pass; the 3 failures in a full `test_datasets.py` run are pre-existing on `develop` (verified on a pristine develop checkout).

AI disclosure: prepared with an AI coding agent; reviewed by the maintainer before it leaves draft.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfe5a5183a1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.