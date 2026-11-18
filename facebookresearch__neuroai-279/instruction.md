# Issue

**Title:** feat(neuralfetch): download Alljoined from the NEMAR BIDS releases

## Description

## What does this PR do?

`Xu2024Alljoined` and `Xu2025Alljoined` now download the curated NEMAR BIDS releases, [nm000133](https://nemar.org/dataexplorer/detail?dataset_id=nm000133) v1.0.4 (~5 GB) and [nm000134](https://nemar.org/dataexplorer/detail?dataset_id=nm000134) v1.0.3 (~8.5 GB), stimuli included. Until now they came from OSF plus the NSD stimuli, and from a 136 GB Hugging Face snapshot.

- New `download.Nemar` backend, like `Openneuro`: files land in `download/<id>/`, `version=` pins the release and keys the success file (a bump downloads again), and `include`/`exclude` select files.
- Images come from each event `stim_file`: Alljoined-1 reads the 960 NSD crops shipped in nm000133 (no NSD download or data access agreement), and the `behav` response markers of Alljoined-1.6M are no longer read as images.
- The training runs of Alljoined-1.6M now carry their image events; the subject-8 file-name workaround is gone.
- `ALLJOINED_ACCEPT_LICENCE` stays on `Xu2025Alljoined`, unchanged from main.
- `neuralset`: `_check_requirements` maps `nemar-py` to its `nemar` module, so `study.download()` finds it.
- The Track 1 tutorial pages quote the new download sizes.

`nemar-py` is already installed here, as a dependency of `moabb` and `eegdash`. The backend asks for `nemar-py>=0.3.1`, which fetches recordings and images from S3.

## Related Issues

The dataset fixes this relies on: nemarDatasets/nm000134#3 and nemarDatasets/nm000133#4. The download speed-up: nemarOrg/nemar-py#4.

## Checklist

- [x] Tests added or updated (`test_nemar`, plus the generic backend test)
- [x] Docstrings updated for any changed public APIs
- [x] `pytest neuralfetch/test_download.py` passes (56 passed); mypy reports no errors in the changed files.

Checked on real data: `study.download()` through `Nemar`, then loading, gives the expected `_info` event counts, image paths and raw shapes for both studies. A dry run over the release manifests selects the same files as before, minus the unused COCO originals of nm000133 (173 MB).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2bdb6cb586d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.