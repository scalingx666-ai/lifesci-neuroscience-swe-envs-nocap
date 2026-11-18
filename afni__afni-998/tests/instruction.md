# Issue

**Title:** 3dInSync: reduce memory with in-mask store, -roi_only, -float16.

## Description

## Summary

Mea culpa: I had only tested this on `short` datasets... OR on machines with a
comical amount of memory. Turns out `float32` data can be very very BIG!
Also had not yet learned how to reduce memory size with mask, poorly had
assumed that applying a mask would release memory (Pete spends too much time
in Rust). This fixes those things, makes data processing 

Reduces the memory `3dInSync` needs for large datasets, and adds `-roi_only`
and `-float16`. Without these, the subject datasets are held on the full grid:
22 subjects x 1310 time points on a 91x109x91 grid needs about 97 GiB,
regardless of `-mask`.

Existing output is unchanged, bit-identical to the previous build.

## What it provides

- **In-mask store.** With `-mask`, only in-mask voxels are kept. Datasets are
  read one at a time and released, so peak memory is the store plus a single
  dataset. This is chosen automatically whenever it is smaller than holding
  the datasets as stored on disk, so there is no new flag. Outputs are
  spread back onto the grid; voxels outside the mask keep their previous
  values (zero, and one for p, q and FWE-p bricks).
- **`-roi_only`** (requires `-atlas`) runs the whole analysis, including
  bootstrap, permutation, temporal-null and condition inference and pair-map
  export, on atlas-parcel mean time series. Each ROI mean is formed as a
  dataset is read, so only subjects x ROIs x time points are held, and the
  FDR/FWE families are the ROIs. `-mask` intersects the atlas first. The
  bucket is painted back onto the input grid, and `PREFIX.roi.1D` lists every
  statistic, one row per ROI. It cannot be combined with `-save_matrix` or
  `-edges*`; `-float16` is ignored with it.
- **`-float16`** holds the data as 16-bit floats. Each voxel series is stored
  as a z-score, with its mean and SD kept in 32 bits, so rounding error is
  relative to each voxel's own variability. Nonfinite input is preserved so
  `-missing` still sees it.
- **Datatype-aware preflight.** The estimate uses the datatype actually
  stored (it assumed float), includes the one dataset resident while loading,
  and reports which representation was chosen.

## Other changes

- `-zcensor` is evaluated while the data are read. Previously it loaded every
  dataset before the memory preflight ran.
- The preflight overwrote its atlas term (`me.shared =` instead of `+=`); the
  estimate now includes it.

## Results

Measured on 22 subjects x 1310 TRs at 2 mm (Shen 268 mask, 161,032 in-mask
voxels), pairwise ISC, 4 threads:

| Mode | Estimated peak | Measured peak |
|---|---|---|
| Full grid (previous behavior) | 97.0 GiB | n/a |
| In-mask, 32-bit | 21.7 GiB | 21.7 GiB |
| In-mask, `-float16` | 13.9 GiB | 13.9 GiB |
| `-roi_only` | 4.4 GiB | not measured |

Peak memory while loading is the store plus one dataset, which is the floor
for any mode.

- `-float16` ISC differs from 32-bit storage by at most 4.4e-5 across all
  in-mask voxels (mean 6e-6; no voxel above 1e-3).
- `-roi_only` matches averaging ROIs first (3dROIstats, then 3dInSync) to
  under 1e-5 on the same data, with 5000 permutations, 1000 bootstraps and a
  1000-draw temporal null in about 2 minutes.

A first version of `-float16` used one scale factor per dataset. It looked
fine on synthetic data but differed from 32-bit by up to 0.01 on this
dataset, because low-variance voxels lost precision. It now normalizes each
voxel separately.

Special thanks to *Claude Opus 5.5* for helping me with the memory reduction
implementations. I learned considerably more AFNI C today.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84c5f76113d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.