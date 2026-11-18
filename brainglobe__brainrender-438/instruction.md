# Issue

**Title:** fix: replace dead streamlines URL with Allen mesoscale connectivity via cloud-volume

## Description

What does this PR do?
Fixes the broken streamlines functionality by replacing the defunct neuroinformatics.nl cache with the official Allen mesoscale connectivity dataset hosted on Google Cloud Storage.

Why is this needed?


The URL `https://neuroinformatics.nl/HBP/allen-connectivity-viewer/json/streamlines_*.json.gz` returns 403 Forbidden. This was a third-party cache that is no longer maintained.

Changes
- Replaced dead URL with `precomputed://gs://allen_neuroglancer_ccf/allen_mesoscale` accessed via cloud-volume — the official source recommended by AIBS (@fcollman)
- Rewrote `get_streamlines_data()` to fetch skeleton data using `cloudvolume.CloudVolume`
- Added `_skeleton_to_dataframe()` to convert precomputed skeleton format (vertices in nm + edges) to the `{"x", "y", "z"}` dict format expected by `Streamlines._make_mesh()`
- Added Z (ML) axis flip to match brainrender's hemisphere convention (verified numerically and visually)
- Added `_get_injection_site_um()` to fetch real injection coordinates from the Allen Brain Atlas API, with graceful fallback to vertex centroid
- cloud-volume is an optional dependency — code handles it missing with a helpful error message
- Preserved existing local JSON caching and `force_download` flag
- Added unit tests with mocked I/O + integration smoke test for GCS

How was this tested?
- All unit tests pass with mocked I/O
- Integration test downloads experiment 479983421 from GCS
- Visually verified experiment 298004028 renders in the correct (right) hemisphere, matching the [Allen connectivity viewer](https://connectivity.brain-map.org/projection/experiment/298004028)
- Numerically verified coordinate transforms against atlas mesh bounds

Is this a breaking change?
No the public API (`get_streamlines_data`, `get_streamlines_for_region`) is unchanged. The output DataFrame format is identical to the old format.

Does this require a documentation update?
Users will need to `pip install cloud-volume` to use streamlines. The code prints a message if it's missing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e080ea33fc48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.