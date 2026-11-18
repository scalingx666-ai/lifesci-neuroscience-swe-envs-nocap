# Issue

**Title:** [FIX] Round millimetre coordinates to the nearest voxel (MKDA/KDA parity with Neurosynth)

## Description

> **Note:** this description has been rewritten to lead with the argument from the voxel-containment definition rather than from Neurosynth parity. An earlier version also claimed GingerALE rounds coordinates; it does not — it places the kernel sub-voxel. See .

Related to #998 (found while cross-checking NiMARE against GingerALE, JALE, pyALE, Neurosynth and CanLab MKDA). This PR does not close an issue.

Changes proposed in this pull request:

- `nimare.utils.mm2vox` rounds transformed coordinates to the nearest voxel instead of truncating toward zero (`.astype(int)`).
- `CoordinateBlock.ijk` and `StudysetView.points_in_mask` are brought in line, so `FocusFilter`, `get_analyses_by_mask` and CBMR all agree on which voxel a focus belongs to.
- Regression tests for fractional coordinates in `mm2vox` and in the mask-membership path.

## Why truncation is wrong

**A voxel index is the answer to a containment question, and "nearest" is its definition.** NIfTI/nibabel affines map integer indices to the *center* of a voxel, so voxel `i` along an axis occupies the millimetre interval `center ± step/2`, and "which voxel contains this point" is `argmin_i |p - center_i|` — round-to-nearest. `floor`, `ceil` and `astype(int)` answer a different question ("which voxel does `p` follow/precede"), which would only be the containment test if the affine mapped indices to voxel *corners*. It does not.

That settles every site where the index is a lookup key rather than a kernel position: `FocusFilter` (`nimare/diagnostics.py`), `Dataset.get_studies_by_mask`, `StudysetView.points_in_mask`, cluster attribution in `Jackknife`/`FocusCounter`. `diagnostics.py` has in fact carried the comment `# mm2vox automatically rounds the coordinates` since #732 in 2022 — the intended contract was already rounding, and the `.astype(int)` was a latent bug rather than a design choice.

**Truncation is not even a consistent `floor`.** Rounding toward zero flips the bias direction at index 0:

| exact index | trunc | round | floor | ceil |
|---|---|---|---|---|
| −0.6 | **0** | −1 | −1 | 0 |
| +0.6 | 0 | 1 | 0 | 1 |

So a focus 0.6 voxels outside the low edge of the array is folded *into* edge voxel 0 and counted as in-mask — exactly what `test_points_outside_mask_volume_are_not_clipped_to_edge` exists to prevent, and something the bounds check in `_get_voxel_values` cannot catch, because the index it is handed is in bounds. Truncation is a property of the integer representation, not a spatial operation: its behaviour depends on where the array origin happens to sit relative to the coordinate.

**It also has no floating-point tolerance.** Sending exact grid points out through `affine` and back through `inv(affine)`, on a 2.3 mm grid 14/200 exact grid points fail to round-trip under `trunc`/`floor`/`ceil` and 0/200 fail under `round`. Rounding has half a voxel of slack; the directed rules have none, so `46.999999999999993` becomes voxel 46.

**A directed rule is a coherent bias, and coherent bias does not average out.** Rounding's error is bounded by half a voxel and is close to zero-mean across foci, so in aggregate it behaves like a small extra blur on top of a 10 mm kernel: it attenuates, it does not move the answer. `floor`/`ceil`/`trunc` displace *every* off-grid focus the same way, so the error is perfectly correlated across studies and survives averaging — the whole group map translates. JALE's `ceil` is the same defect with the opposite sign. "Half a voxel is small next to reporting uncertainty" is an argument about noise and no argument at all about bias.

**Directed rules are not equivariant under storage orientation.** Flipping an axis of the template (`i -> N-1-i`; LAS versus RAS on disk, an identical image) turns `floor` into `ceil`. Under truncation, which voxel a focus lands in therefore depends on how the template happens to be written to disk rather than on the data. Rounding is invariant under that flip, except on exact ties.

## The tie rule, stated explicitly

On a 2 mm grid every odd-millimetre coordinate lands exactly on `.5`, and 49% of the real published coordinates in a NeuroStore release have at least one odd-millimetre value. The tie set is not a measure-zero edge case here, it is the bulk of the data, so the tie rule deserves to be named rather than left implicit in `np.round`:

```
odd mm x   : -11  -9  -7  -5  -3  -1   1   3   5   7   9  11
exact i    : 50.5 49.5 48.5 47.5 46.5 45.5 44.5 43.5 42.5 41.5 40.5 39.5
half-even  :  50  50  48  48  46  46  44  44  42  42  40  40   <- np.round, this PR
half-up    :  51  50  49  48  47  46  45  44  43  42  41  40
```

- **half-even** (`np.round`) has no net displacement — half the ties go each way — but it distorts local geometry on the tie set: foci 2 mm apart collapse into one voxel or land 2 voxels (4 mm) apart.
- **half-up** (`floor(v + 0.5)`) preserves spacing uniformly, but reintroduces a half-voxel directed bias on 49% of foci whose direction depends on the sign of the affine — i.e. precisely what the section above rejects.

This PR takes half-even: aggregate unbiasedness matters more than local spacing when everything is about to be convolved with a ~10 mm kernel, and it matches Neurosynth's own `np.round_` bit-for-bit. Worth being clear about what the tie analysis shows, though: no snapping rule is simultaneously unbiased, spacing-preserving and orientation-invariant. Only *not* snapping is all three — see scope, below.

## Corroboration: Neurosynth parity

`MKDAChi2` is a port of Neurosynth, which rounds (`np.round_` in `xyz_to_mat`). Same split, same 10 mm kernel, same mask:

| coordinates | `pAgF` Pearson r | support Dice |
|---|---|---|
| whole millimetres | 1.000000 | 1.00000 |
| fractional | 0.912758 | 0.85780 |
| fractional, with this fix | **1.000000** | **1.00000** |

Those coordinates are Gaussian-jittered floats rather than half-voxel ties, so this measures the rounding rule and not the tie rule; `numpy`'s round-half-to-even matches Neurosynth's `np.round_` exactly. NiMARE was the only implementation surveyed that truncates.

**Why it stayed hidden.** The coordinate tables in the test data are whole even millimetres, for which `(x + 90) / 2` is exact and truncating and rounding agree. Data reported at 1 mm resolution, at odd millimetres, or transformed from Talairach hits it on nearly every focus.

## Scope: this is not the GingerALE fix

GingerALE does not snap foci to voxels at all — it places the Gaussian at the exact reported coordinate. On 918 real NeuroStore coordinates, ALE versus GingerALE moves 0.9920336 → 0.9920699, i.e. neutral. The dominant cause of NiMARE/GingerALE disagreement on odd-millimetre data is voxel snapping versus sub-voxel kernel placement, not the snapping rule: on NeuroStore, all 44 studies containing at least one odd-millimetre peak disagree and all 25 without agree exactly.

Sub-voxel kernel placement is a coherent package rather than a one-line change, and belongs in its own issue. Two constraints for whoever picks it up:

1. **Exchangeability with the null.** `_compute_null_montecarlo` draws null foci as `vox2mm(rand_ijk, affine)` (`nimare/meta/cbma/base.py`, twice, and `mkda.py`), so null foci sit exactly on voxel centres. Placing observed foci sub-voxel while null foci stay on-grid means the two are no longer identically processed: an on-grid focus attains the kernel maximum at a voxel, a sub-voxel one never quite does, so observed summary statistics are deflated relative to the null and p-values drift conservative. Sub-voxel placement for the data requires jittering the null within voxels too.
2. **Implementation.** `compute_ale_ma`/`compute_kda_ma` stamp a precomputed kernel array at integer offsets into a sparse accumulator, so sub-voxel placement means per-focus kernel evaluation or shifted-kernel construction.

## Tests

- `test_mm2vox_rounds_fractional_coordinates` and `test_points_off_the_voxel_grid_go_to_the_nearest_voxel`, both verified to fail without the change.
- `test_focusfilter`'s expected count moves 1101 → 1100. 316 of the Laird dataset's 1117 foci are off-grid (129 Talairach projections, the rest reported at odd millimetres); rounding moves seven of them across the mask boundary, one more out than in. These are boundary foci being reassigned to the voxel they are actually closest to.
- `test_utils.py` (26) and `test_meta_ale.py` (48) pass.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_0136uwKxsTXritpLxdAthbDX

## Summary by Sourcery

Round off-grid millimetre coordinates consistently to the nearest voxel across coordinate conversion, masking, and CBMR processing.

Bug Fixes:
- Round millimetre coordinates to the nearest voxel instead of truncating toward the origin, restoring parity with Neurosynth for fractional coordinates.

Enhancements:
- Align coordinate-block indexing, mask queries, and focus filtering with the corrected nearest-voxel assignment.

Tests:
- Add regression coverage for fractional coordinate conversion and nearest-voxel mask membership, and update affected filtering expectations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f22be2c798f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.