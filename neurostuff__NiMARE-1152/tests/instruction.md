# Issue

**Title:** [ENH] Allow random processes to be seeded for reproducibility

## Description

Monte Carlo nulls and FWE correction drew from NumPy's global random state, so a meta-analysis could not be reproduced exactly from run to run.

Add a `random_state` parameter to every stochastic CBMA estimator (ALE, ALESubtraction, SCALE, MKDADensity, MKDAChi2, KDA; BalancedALESubtraction already had one and now inherits the shared attribute) and route all of their permutation draws through it:

- `_compute_null_montecarlo`, `_compute_null_reduced_montecarlo` and `correct_fwe_montecarlo` in the CBMA base class
- MKDAChi2's random-foci FWE null
- SCALE's voxel sampling
- the per-iteration seeds of the pairwise label permutations used by ALESubtraction and MKDAChi2

Each stochastic step draws from its own stream, derived from the seed with a stable hash, so the uncorrected null and the FWE null are never built from the same permutations, and a fresh generator per call makes repeated calls on one seeded estimator reproducible.

`random_state=None` keeps existing behaviour everywhere: unseeded where the procedure was unseeded, and, for the pairwise label permutations that were already deterministic, the iteration-index seeds they used before.

Also:

- LDAModel gained a `random_state`, passed through to scikit-learn.
- GCLDAModel draws from its own RandomState instead of seeding NumPy's global one, and no longer reseeds it on every Gibbs iteration (the sampling itself runs under numba, which the global seed never reached). Draws are unchanged, so `seed_init` still fixes the model.

Add nimare/tests/test_reproducibility.py and a "Reproducible results" section to the CBMA docs.

Claude-Session: https://claude.ai/code/session_0132Md3Z3JSHpD5xt3mcKqTV

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
Closes # .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Add reproducible random-state support across stochastic meta-analysis and topic-modeling workflows without altering legacy unseeded behavior.

New Features:
- Add configurable random-state seeding across stochastic CBMA estimators and LDA models for reproducible analyses.
- Use independent reproducible random streams for Monte Carlo nulls, FWE corrections, voxel sampling, and pairwise permutations.
- Keep GCLDA's seeded model behavior while preventing it from modifying NumPy's global random state.

Bug Fixes:
- Prevent stochastic model fitting from resetting or depending on NumPy's global random state.

Enhancements:
- Centralize deterministic random-stream and per-iteration seed handling, while preserving existing unseeded and legacy deterministic behavior when random_state is None.

Documentation:
- Document reproducible CBMA results and the new random_state behavior.

Tests:
- Add comprehensive reproducibility tests covering random utilities, CBMA estimators, permutation and FWE procedures, LDA, SCALE, and GCLDA.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70a6c648fbb6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.