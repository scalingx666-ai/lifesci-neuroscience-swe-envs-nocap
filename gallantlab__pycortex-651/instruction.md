# Issue

**Title:** ENH Pure-python surf2surf matrix (direct nnfr construction)

## Description

## Summary

`get_mri_surf2surf_matrix` previously reverse-engineered FreeSurfer's `mri_surf2surf`: it warped the coordinate maps through the binary, probed it with 40 random test images, and solved a per-vertex least-squares problem to recover the sparse transform. That required FreeSurfer installed and called several times.

The mapping FreeSurfer actually computes is just its **nnfr** (nearest-neighbor, forward-and-reverse) rule on the spherical registration:

- **Forward** — every target vertex takes the value of its nearest source vertex on `?h.sphere.reg`.
- **Reverse** — any source vertex that no target selected (an "orphan") is folded into its nearest target, so no source data is dropped. This is what makes downsampling an *average* rather than a subsampling.

This PR builds that sparse matrix **directly from `?h.sphere.reg`** with two KDTree queries — no subprocess, no random probing, deterministic.

## Correctness

Verified against the real `mri_surf2surf` binary:

- individual-subject ↔ `fsaverage` and subject ↔ subject, both hemispheres: **bit-exact** (corr = 1.0, maxdiff ~2e-7).
- The one documented inexact case is the regular icosahedral targets (`fsaverage6/5/4/3`): many fine vertices sit *exactly* equidistant between two coarse vertices, and FreeSurfer breaks those ties by an internal vertex ordering this implementation does not reproduce (corr ~0.997–0.9999). The numerical difference is tiny (the alternative neighbor is the same distance away) and is documented inline rather than chased.

## API / compatibility

- Same name and return type (`(n_target, n_source)` sparse matrix, applied as `matrix.dot(source_data)`); `database.get_mri_surf2surf_matrix` caching and `Vertex.to_other_subject()` are unaffected.
- `surface_type` is now vestigial (the correspondence depends only on the spherical registration, identical across a subject's surfaces) but kept for signature compatibility.
- Legacy regression kwargs (`n_neighbors`, `n_test_images`, ...) are accepted with a `DeprecationWarning` and ignored; unknown kwargs raise `TypeError`.
- Removed the now-unused `scipy.linalg.lstsq` import.

## Tests

- 9 FreeSurfer-free unit tests: identity when src==trg, rows sum to 1, constant-map preservation, the no-source-dropped invariant, a hand-computed averaging example, and legacy/unknown-kwarg handling.
- 2 FreeSurfer-gated integration tests using **only standard `fsaverage` templates** (no individual subject IDs): `fsaverage→fsaverage` identity (bit-exact vs binary) and `fsaverage→fsaverage6` downsample (corr check). They skip when `mri_surf2surf` is unavailable.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9312115efd39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.