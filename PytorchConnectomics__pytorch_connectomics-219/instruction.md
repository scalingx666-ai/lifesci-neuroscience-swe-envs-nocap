# Issue

**Title:** Add liconn_ingest: ND2 -> uint8 OME-Zarr at native resolution -> GCS

## Description

The stage in front of neuron_liconn_moe that was never in the repo. That tutorial starts from preprocessed/<clip_variant>/zarr/; this produces those. Until now the ND2 -> uint8 conversion existed only as a script on BC, which is why its provenance was documented in a README on /projects rather than here.

Stages are fetch -> preprocess -> publish -> verify -> prune, each idempotent, each writing provenance.json and a COMPLETE marker. Reuses what already exists rather than reimplementing it: scripts/preprocess_liconn.py for the per-plane clip + CLAHE, prepare_volume.py::_ome_multiscales for the NGFF metadata (so the two tutorials cannot drift on how they declare physical spacing), and the same gzip-magic guard as upload_seg_precomputed.py.

Output is level 0 only, at native resolution. Keeping the resample onto the checkpoint grid as a separate zarr -> zarr step means changing the training grid never means re-reading ND2 -- which matters while that grid is contested.

Three refusals are deliberate:

- --clip-variant has no default. Two variants with identical dataset names exist and the component is load-bearing (volumes.py::GCS_PREFIX).
- Exposures parse to an unordered frozenset. ExPID71_120ms-30ms_... lists 120 first but the plane was illuminated 30 ms first, so filename order is not acquisition order and no caller may imply one; pass --exposure-ms from ND2 metadata.
- prune re-hashes the raw against provenance.json:source_sha256 and refuses without a passed verify. Once the ND2 is gone that hash is the only surviving evidence of what was processed.

naming.py is unit tested (9/9) and gates the Docker build: anisotropy invariance under expansion fold, 0.1625 um / 32 -> 5.078125 nm, and the real _28xx typo and fractional _14p5x both parsing. The ND2, zarr and GCS paths are NOT exercised -- neither Docker nor rclone was available where this was written.

Also fixes neuron_liconn_moe/README.md, stale since 2026-09-16: the image groups moved to donglai_public under the same clip_percentile_1_99 prefix as the seg layers, so the "separate buckets" and "clip component is gone from the path" points described a split that no longer exists, and the published URLs omitted the clip component. A reader following them looked in the wrong bucket.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `652b9795fb1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.