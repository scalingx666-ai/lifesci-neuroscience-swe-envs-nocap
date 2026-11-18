# Issue

**Title:** Add Mutex Watershed decoder (affogato-backed)

## Description

Adds `decode_mutex_watershed`, a seedless affinity->instance decoder wrapping affogato.segmentation.compute_mws_segmentation (Wolf et al., "The Mutex Watershed", ECCV 2018). Registered as `decode_mutex_watershed` alongside the existing `decode_affinity_cc` / `decode_waterz`.

- Consumes (C, Z, Y, X) affinities with attractive (short-range) + repulsive (long-range) offsets; reuses parse_affinity_offsets. Defaults to the 6-channel banis layout when C == 6.
- Handles the affinity-convention detail: PyTC nets predict P(same segment) on all channels, so the repulsive channels are inverted (1 - aff) by default so MWS sees high = split. Toggleable via invert_repulsive / invert_attractive.
- strides / randomize_strides for repulsive-edge subsampling; min_instance_size cleanup. Graceful ImportError when affogato is absent, mirroring the waterz wrapper.
- setup.py: `mws` extra placeholder documenting the conda-forge install.
- tests/unit/test_decode_mutex_watershed.py: 9 tests covering registration, the ImportError path, offset defaulting/validation, channel inversion, and stride forwarding (mocks the conda-only C++ lib so they run in CI).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a509fab12969`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.