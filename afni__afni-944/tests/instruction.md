# Issue

**Title:** 3dReHo: fix tie handling in CalcRanksForReHo

## Description

.

CalcRanksForReHo declares its working array as

```c
int *sorted=NULL; // hold sorted time course, assume has been turned into int
```

but fills it from `THD_get_voxel()`, which returns `float`. Every value is truncated toward zero before the tie test, so two distinct values sharing an integer part are treated as tied — their ranks get replaced by an average rank, and the Kendall's W tie-correction term is inflated. The comment says "assume has been turned into int", but I couldn't find a path where that's guaranteed for the input time series.

The severity scales with signal amplitude, so it biases ReHo differently across datasets. Comparing the current rank computation against a midrank reference over 46-point series, 20k trials per condition:

| input scale | series with incorrect ranks | max rank error |
|---|---|---|
| values in [0, 1) — e.g. percent signal change, unit-variance scaling | 100% | 22.5 |
| values in [0, 10) | 100% | 7.0 |
| values in [0, 1000) — typical raw EPI | 64% | 1.5 |

On data of order 1 every value collapses into a single tie group, which is the degenerate case.

Storing the value as `float` makes the comparison lossless. I re-verified the merged result — your in-loop tie handling plus this change — against an independent midrank + tie-count reference: 20,000 fuzz trials across heavy-tie integer data, small floats, and one-decimal data, plus targeted cases for ties at the start, at the end, spanning the whole series, and n=2. Ranks and tie counts match exactly.

**One thing to flag on CI:** `test_3dReHo` and `test_3dReHo_with_box` fail here, but they are also failing on `master` — since c4515647, the merge of the tie fix. The stored reference in `afni_ci_test_data/sample_test_output/ptaylor/` predates that fix, so it encodes the old tie behaviour. Master shows 14.6% of voxels mismatched; this branch shows 14.7%, the small extra being the truncation fix. So the sample output needs regenerating regardless of this PR, and I don't have write access to `afni_ci_test_data` to do it. Happy to generate and send the updated reference if that's useful.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c2bd546a782`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.