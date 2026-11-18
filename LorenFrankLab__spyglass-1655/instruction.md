# Issue

**Title:** fix(spikesorting v1): tempdir param rejected by spykingcircus2/tridesclous2

## Description

**Description**

`spykingcircus2` and `tridesclous2` are the only two spike sorters that install with `spikeinterface` itself, with no extra setup (no MATLAB, no GPU, no singularity container).

`_run_spike_sorter()` unconditionally hands every sorter a `tempdir` parameter (needed by folder-based sorters like `mountainsort4`), and only strips it back out for `mountainsort5` and the singularity-routed sorters. Neither of these two were on the exemption list, so SpikeInterface's own parameter validation rejects the call.

Found while running a real end-to-end spike-sorting demo. The fix has been verified against a real recording, including a ground-truth spike-sorting comparison to confirm the sorter itself still produces a correct result once the crash is gone.

Verified manually end-to-end (real NWB ingestion → recording extraction → artifact detection → completed sort, checked against ground truth) rather than with an automated test. Happy to add one if a maintainer points me at the right fixture pattern for this pipeline.

- : extends the existing `mountainsort5` exemption so `spykingcircus2`/`tridesclous2` are also excluded from the `tempdir` injection.
  - src/spyglass/spikesorting/v1/sorting.py: one-line condition change (if sorter == "mountainsort5" → if sorter in ("mountainsort5", "spykingcircus2", "tridesclous2"))
  - CHANGELOG.md: added corresponding entry under Spikesorting

**Checklist:**
- [x] N/A. Not accompanied by a release, no CITATION.cff change needed.
- [x] N/A. Doesn't edit table definitions, no alter snippet needed.
- [x] N/A. Doesn't touch position, no local test run needed.
- [x] N/A. No user-facing changes to docs/notebooks. Sorter selection already works the same way for any other exempted sorter.
- [x] I have updated the CHANGELOG.md with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b846bc43b49`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.