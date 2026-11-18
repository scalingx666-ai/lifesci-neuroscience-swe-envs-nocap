# Issue

**Title:** Changed how firingrate is scaled to maximum for BVCs.

## Description

To scale the firingrates of BVCs to between `min_fr` and `max_fr`, a maximum firingrate for each BVC must be computed during initialization.

The previous approach was to compute a within-environment estimate. However, particularly for FieldOfViewBVCs where head direction and position conjunctively determine firingrates, these values were sometimes being underestimated (). Improving the estimates with more samples would be computationally demanding.

This PR proposes a new approach in which max firingrates are computed analytically as the maximum possible activity for each BVC (i.e., the firing rate for each BVC, if its receptive field is fully occupied by a boundary):

```
self.cell_fr_norm = utils.von_mises(
    theta=self.test_angles.reshape(1, -1),
    mu=0,
    sigma=self.sigma_angles.reshape(-1, 1),
    norm=1,
).sum(axis=1)
```

**Notes for users**: 
- **Remaining noise:** In most use cases, `max_fr` should now be more accurate. However, in a few cases (i.e., for BVCs with very small receptive fields), the maximum observed firing rate may still slightly overshoot the `max_fr`. This appears to be due to numerical error ( for details), and was mostly observed when using `"uniform_manifold"` cell arrangements.
- **Biggest change:** Users may see a big change in BVC firing rates if their BVCs have very large or very distant receptive fields (i.e., BVCs that are unlikely to be maximally occupied in a given environment). The normalization factors for these cells will be much higher that if calculated empirically, and these cells may show much lower firing rates than before.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `906aab596d74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.