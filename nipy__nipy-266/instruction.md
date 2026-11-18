# Issue

**Title:** Implement slice_times argument in FmriRealign4D

## Description

As previously discussed on the mailing list, the `slice_order` argument of FmriRealign4D is confusing as it has a different meaning than in the SPM slice timing routine. It is also restrictive as it does not enable us to represent irregular slice acquisition schemes.

The initial aim of this PR was to deprecate `slice_order` (as well as other additional parameters `tr_slices` and `start`)  and implement a `slice_times` keyword argument which would become mandatory in future versions.

In the meantime, there have been several suggestions that this approach may discourage users as it will hamper backward compatibility in the future. Therefore, the latest commits in this PR aim to have `slice_times` coexist with the previous API. The redundancy between input arguments is dealt with by making sure that the FmirRealign4D initialization method raises a value error when inconsistent parameters are input.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46afff0e2f6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.