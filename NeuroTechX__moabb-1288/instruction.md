# Issue

**Title:** Chailloux2020, Nieto2022, TrianaGuzman2024: read the NEMAR raw mirror first

## Description

Chailloux2020 (`nemar_id = "on003190"`), Nieto2022 (`"on003626"`) and TrianaGuzman2024 (`"on005342"`) declare NEMAR's raw OpenNeuro mirrors but never use them. None of them is an `OpenNeuroMirrorMixin`, and the deposits have no `sourcedata/`, so the prefetch finds nothing (`No files matched the BIDS query: scope=sourcedata`). With the default `"auto"` provider all three always download from `s3.amazonaws.com/openneuro.org` (found by an audit of every dataset with a `nemar_id`).

### Change
They now route through `OpenNeuroMirrorMixin`, like Lee2022, Lioi2020, Peterson2020, Daly2020 and Damm2026:
- Under `"auto"` and `"nemar"` they read the mirror first (`scope="raw", datatype="eeg"`), using the deposits' subject labels (`{subject:02d}` and `{subject:03d}`). OpenNeuro stays the fallback, and the only source with `"upstream"`.
- Nieto2022: `data_path()` returns the session BDF from the mirror. `download()` is overridden because the mixin's version passes `path` positionally, and Nieto2022's `data_path` takes `session` there.
- TrianaGuzman2024: the mirror root gets the same `dataset_description.json` and comma-decimal `events.tsv` repair as the S3 path.
- Chailloux2020: `data_path()` returns the mirror's subject directory, and `_get_single_subject_data` reads from what `data_path()` returns. The labels `sub-01 .. sub-019` map through `nemar_subject_template = "0{subject}"`.

### Verification (Voyager, this branch alone on develop)
| Dataset | develop: class, upstream hosts | this branch: class | sessions/runs develop -> branch |
|---|---|---|---|
| Nieto2022 | upstream_only (s3.amazonaws.com) | nemar_only | 3/3 -> 3/3 |
| TrianaGuzman2024 | upstream_only (s3.amazonaws.com) | nemar_only | 1/1 -> 1/1 |
| Chailloux2020 | upstream_only (s3.amazonaws.com) | nemar_only | 3/15 -> 3/15 |

### Tests
`moabb/tests/test_openneuro_nemar_routing.py` (offline, 8 tests): the transport call flags for all three, including Chailloux2020's 3-digit labels; no sourcedata prefetch; Nieto2022's mirror path and `"upstream"` fallback; TrianaGuzman2024's mirror root repair; Chailloux2020's mirror subject directory. They fail without the change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c0380b53454`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.