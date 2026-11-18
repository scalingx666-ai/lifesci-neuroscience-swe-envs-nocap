# Issue

**Title:** Update fmri_data/rescale

## Description

**New feature**
Added 'zeropreservequantile' method — zero-preserving quantile harmonization per voxel across images, with optional 'jitter' and 'seed' parameters. Errors out if only one image. Implemented via a new subfunction local_zeropreserve_quantile at the bottom of the file.

**Bug fixes**
1. centervoxels — removed a stray scale(...) line that double-centered the data and re-introduced the missing-voxel bug the new code was meant to fix.
2. rankimages — fixed invalid 2-D indexing (d(~ismissing, i) = → d(~ismissing) =) that would have errored at runtime.
3. prctileimages — the per-image normalization-by-valid-count was dead code (modified a local d that was never written back). Now correctly applied to the output bins.
4. windsorizevoxels — was iterating 1:nok and using that as a row index, processing the wrong voxels when bad rows existed. Now iterates over find(~whbad). Also fixed a fprintf that had two format specifiers but only one argument.

**Performance**
1. rankvoxels vectorized — replaced per-voxel loop with single tiedrank(d')' call. 
2. prctileimages — replaced O(N×1000) inner bin-assignment loop with a single discretize() call, and converted the outer image loop to parfor with a sliced local matrix.

**Cleanup**
1. Removed empty 'correly' case that silently did nothing.
2. Removed stale "not implemented yet" comment in session_grand_mean_scaling_spm_style (the method is fully implemented).
3. Added missing history entry to l1norm_images.
4. fmridat.history initialization added at the top so {end+1} indexing never crashes if the field is empty [] or missing.
5. Modernized nanmean/nanstd — replaced all 9 instances with mean(..., 'omitnan') / std(..., 'omitnan') (the nan* variants are deprecated).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a6c1f8b1a91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.