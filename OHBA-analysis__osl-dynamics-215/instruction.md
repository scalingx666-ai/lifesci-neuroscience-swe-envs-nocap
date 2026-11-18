# Issue

**Title:** Reparameterisation of covariance matrices

## Description

There might be a reason for the current structure, but:

- Move  `_model_structure` into the Model class.
- Separate the logic for constructing the covariance matrix into its own method.

This allows for overrides of DyNeMo in an easier way.

e.g.:
```python
class FreqDyNeMo(Model):
    def _select_covariance_layer(self):
        return DampedOscillatorMatricesLayer(
            n_embeddings=self.config.n_channels,
            sampling_frequency=100.0,
            n_modes=self.config.n_modes,
            learn=config.learn_covariances,
            name="covs",
        )
```

This should allow faster prototyping of models with slightly altered observation matrices.
Separation of duties is generally sensible too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3275965de4bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.