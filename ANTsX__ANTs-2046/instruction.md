# Issue

**Title:** PERF: Avoid per-voxel neighborhood copies in Atropos MRF update

## Description

# Description

This change comes from a performance review of ANTs.

## Problem

The Atropos MRF code runs once for each voxel in each ICM pass. At each voxel, it made copies of the neighborhood that it did not need:

- Three sites called `It.GetNeighborhood().Size()` (in `PerformLocalLabelingUpdate` and in the two loops of `GetPosteriorProbabilityImage`). `GetNeighborhood()` returns a full `Neighborhood` copy (a heap buffer and an offset table). The code used the copy only to read its size.
- `PerformLocalLabelingUpdate()` and `EvaluateMRFNeighborhoodWeights()` took the iterator by value. Each call copied the iterator and built its offset table again.

## Fix

```diff
 PerformLocalLabelingUpdate(
-  NeighborhoodIterator<ClassifiedImageType> It)
+  NeighborhoodIterator<ClassifiedImageType> & It)
   ...
-  if (... && (It.GetNeighborhood()).Size() > 1)
+  if (... && It.Size() > 1)

 EvaluateMRFNeighborhoodWeights(
-  ConstNeighborhoodIterator<TClassifiedImage> It, ...)
+  const ConstNeighborhoodIterator<TClassifiedImage> & It, ...)

 GetPosteriorProbabilityImage (2 loops)
-  if (... && (ItO.GetNeighborhood()).Size() > 1)
+  if (... && ItO.Size() > 1)
```

- `ConstNeighborhoodIterator` derives from `Neighborhood`, so `It.Size()` gives the same value without a copy.
- `PerformLocalLabelingUpdate` only reads `GetIndex()` and calls `SetCenterPixel()`. These calls do not move the iterator, so the caller sees no change.
- `EvaluateMRFNeighborhoodWeights` only calls the const `GetPixel(n, bool &)`. A `NeighborhoodIterator` binds to the const base reference without a copy.

The diff is 2 files, +9/-8 lines. It uses only API that is in ITK 5.4.7 and in ITK 6.

## Evidence

Host: AMD Ryzen 9 9950X, GCC 15, ITK 6 pinned build. Base is upstream `main` (73b37cee), built with the same compiler and flags.

Input: `T1w2mm.nii.gz` (79x107x83, 2 mm), Otsu mask. Common arguments:

```
Atropos -d 3 -a T1w2mm.nii.gz -x mask.nii.gz -r 0 -i kmeans[3] -c [5,0] -o [seg.nii,post%02d.nii]
```

Atropos uses a time-based random seed by default (`-r 1`), so all checks use `-r 0`. First, I confirmed that base equals base.

| Case | Options | Threads | Base wall / CPU (median of 3) | PR wall / CPU (median of 3) |
|---|---|---|---|---|
| A | `-m [0.2,1x1x1]` | 1 | 1.25 s / 1.21 s | 0.93 s / 0.90 s (-26 % wall) |
| B | `-m [0.3,1x1x1] -p Socrates[1]` | 1 | 1.20 s / 1.18 s | 0.93 s / 0.90 s (-23 % wall) |
| C | `-m [0.2,1x1x1]` | 4 | 0.86 s / 1.23 s | 0.68 s / 0.93 s (-21 % wall, -24 % CPU) |

Peak RSS is the same within noise (130-135 MB) for base and PR.

**Output is bit-identical.** For each case, the md5 of `seg.nii` and `post01-03.nii` is the same over all 6 runs (3 base + 3 PR):

- A and C: seg `76069e40446a7e1c4f519fb79cb1713c`, post01 `1f563d1882d8d4134cd6e749db4eea36`, post02 `800186de21302ae48598ac27b57979e4`, post03 `ecb932bc89ef7b81b2bcb1ee062c0572`
- B: seg `4d8962320a62f61f128ec27448bda275`, post01 `3dba9775b49b4367979d58fa5345c701`, post02 `9bf9cdd28d351dec1b1ce6d21f78ce7c`, post03 `1c807bfabd621f1250a95fa4589e8567`

The review ran more checks (1 thread, `-r 0`). In each check, `seg.nii` and all `post*.nii` are byte-identical between base and PR:

- A full-image mask, to use the edge voxels and the out-of-bounds path: `kmeans[3]`, `-m [0.3,1x1x1]`.
- MRF radius 2x2x2, `kmeans[4]`, `HistogramParzenWindows`.
- The 2D template: one axial slice with a 2D mask, `-m [0.3,1x1]`.

## Merge Danger

**Door:** two-way

The change is one small commit. A revert is easy.

**Blast Radius:** Atropos

Only the Atropos MRF code paths change (also `antsAtroposN4.sh` and other scripts that call Atropos). The output does not change.

## Caveats

- The total times include I/O and the k-means start. Thus the speedup of the MRF step alone is larger than 21-26 %. The test image is small and epic is a shared host, so the wall times are indicative only.
- I built only against ITK 6 on epic, not against ITK 5.4.7. The review read the v5.4.7 sources: `Neighborhood::Size() const`, `ConstNeighborhoodIterator::GetPixel(NeighborIndexType, bool &) const` and `NeighborhoodIterator::SetCenterPixel` have the same signatures. CI will do the ITK 5.4.7 build.
- `GetPixel(n, bool &)` now fills the `InBounds` cache in the caller's iterator, not in a temporary copy. This cache depends only on the current location, and each iterator move clears it. Thus the behaviour does not change.
- clang-format on the changed lines also aligned one unchanged parameter in the `.hxx`, and put the return type of the `PerformLocalLabelingUpdate` declaration on a separate line, as in the declarations next to it.
- Atropos stops with an error when there is no `-x` mask, so I did not test a run without a mask.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01PNXvHV1W5jffxpEwqs3iYY

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73b37cee7c56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.