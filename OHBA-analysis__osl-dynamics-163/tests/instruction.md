# Issue

**Title:** Refact: Scaling factor

## Description

The way we scale the losses related to static quantities (KL losses of deviation magnitudes in subject embedding models, regularisation of observation model parameters) is refactored.

- There's no more confusing `n_batches` attribute in regularizers.
- Removed methods `obs.set_bayesian_kl_scaling` and `obs.set_dev_mlp_reg_scaling`.
- Every model has a layer for calculating the scaling factor called `scaling_factor`
- the `scaling_factor` layer is set by `mod_base.set_scaling_factor` and this will be done automatically for all models when fitting a model [https://github.com/OHBA-analysis/osl-dynamics/blob/5a3e58b7e349c68bc93a39a58acd2fa2e892db5b/osl_dynamics/models/mod_base.py#L237](url)
- No more confusing `data, inputs = inputs` in the call method in the `MultiLayerPerceptronLayer` class. 

Potential drawback:

- This will require all later developed models to have the layer `scaling_factor`.

This  .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7d68177e7e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.