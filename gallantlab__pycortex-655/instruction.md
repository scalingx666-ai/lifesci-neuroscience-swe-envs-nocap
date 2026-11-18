# Issue

**Title:** ENH Visualize HCP fs_LR 32k data and resample to fsaverage (cortex.hcp)

## Description

Adds a `cortex.hcp` module to visualize HCP fs_LR 32k data with pycortex — natively on the HCP template and resampled to fsaverage.

> **Stacked on #651** (`surf2surf-pure-python`). Until #651 merges, this PR's diff also shows its two commits; review/merge this after #651 (or it will auto-clean once #651 lands in `main`).

## What's new

**`cortex.hcp`**
- `download_fs_lr()` — fetch the prebuilt `32k_fs_LR` pycortex subject (registered with `download_subject`) for native fs_LR rendering via the usual `cortex.Vertex(...)` / `quickshow` path.
- `cifti_to_surface()` / `get_cifti_vertex_indices()` — expand CIFTI cortical grayordinates (59412) to the full 64984-vertex fs_LR surface, NaN medial wall (tolerates hemispherically split files).
- `project_fslr_to_fsaverage()` / `to_fsaverage()` — resample fs_LR 32k data to fsaverage5/6/fsaverage using a pure-python **spherical-barycentric** matrix built from the HCP standard-mesh spheres. This matches `wb_command -metric-resample ... BARYCENTRIC`, so **Connectome Workbench is not required at runtime**.

**FreeSurfer-free `upsample_to_fsaverage`**
- The per-vertex nearest-neighbor mapping is a fixed property of the fsaverage tessellation, so precomputed neighbor tables for fsaverage5/6 now ship with pycortex (`cortex/data/upsample_fsaverage_neighbors.npz`, 0.68 MB), with a compute-from-sphere (+cache) fallback for other orders. Output is **numerically identical** to the previous implementation; `$SUBJECTS_DIR` is no longer needed for the common cases.

**Example + tests**
- `examples/hcp/plot_hcp_fs_lr.py` renders both the native and the resampled flatmaps (runs on CI with no FreeSurfer).
- `cortex/tests/test_hcp.py` (barycentric matrix math, CIFTI expansion, `wb_command` validation when available) and new FreeSurfer-free `upsample_to_fsaverage` tests.

## Notes
- The `32k_fs_LR` subject is derived from HCP S1200 group-average Open Access surfaces and redistributed under the WU-Minn HCP Consortium Open Access Data Use Terms (with the required acknowledgment); its download URL is registered in `download_subject`.
- Verified the bundled `.npz` ships in the built wheel and loads from the installed package.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_019z37ML4wsmosg5Xvvq6ENN

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9456472b4b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.