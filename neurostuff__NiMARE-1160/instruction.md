# Issue

**Title:** [ENH] Add fetch_neurostore and deprecate fetch_neurosynth

## Description

.

Changes proposed in this pull request:

- Add `nimare.extract.fetch_neurostore`, which downloads a [NeuroStore studyset release](https://neurostore.org/api/neurostore-studyset-releases/), verifies the published sha256 of the archive, extracts the parquet tables, and returns a `Studyset` (or the extracted directory with `return_type="files"`). Releases are cached per version under `<data_dir>/neurostore/<version>/`, and `version=` accepts `"latest"` (most recent dated release), `"nightly"`, or an explicit version such as `"2026-09"`.
- Add `nimare.extract.fetch_neurostore_releases`, which lists the releases available from the API (version, release type, build date, study count).
- Deprecate `fetch_neurosynth`: it now emits a `FutureWarning` naming `fetch_neurostore` and explaining that the Neurosynth files are a frozen snapshot — the coordinates were extracted in 2018, and the files were last repackaged in 2021. It keeps working — it is still the way to reproduce published Neurosynth analyses and to get the term annotations NiMARE's Neurosynth-based decoders need — and the warning message says how to silence it.
- Point at the new fetcher everywhere Neurosynth data is downloaded or described: `docs/fetching.rst` (new "Where should coordinate data come from?" section), `docs/decoding.rst`, `docs/api.rst`, the `convert_neurosynth_to_dataset` docstring, the dataset example gallery README, a warning at the top of `examples/01_datasets/02_download_neurosynth.py`, and a new `examples/01_datasets/08_fetch_neurostore.py` example. `fetch_neuroquery` gets a docstring note pointing to NeuroStore as well, but no warning — this issue is about Neurosynth.

Notes for reviewers:

- Reading the release requires `pyarrow` (NiMARE's `parquet` extra); `return_type="files"` does not.
- Archives are extracted with tarfile's `data` filter, so a release cannot write outside the download directory.
- Tests use a tarball built from the packaged parquet studyset resource and a stubbed `requests`, so no test hits the network. I also ran the fetcher against the live API once while developing: the `2026-09` release downloads, checksums, extracts, and loads as a `Studyset` with 32,444 studies / 115,748 analyses.
- One unrelated one-liner: `.gitignore` covered `venv/` but not `.venv/`, which `.skills/dev_environment` tells contributors to create.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01VBaxjomGEyyoNNLD7PJ8tV

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aef1ae489bd1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.