# Issue

**Title:** register: `@affine FACTOR` sets the affine prior precision; fix per-component affine penalty

## Description

## Summary
- **`@affine FACTOR`** now sets λ, the precision of a Gaussian prior N(0, (λ I)⁻¹) on the model-basis affine Lie parameters q. This adds ½λ‖q‖² to the objective. FACTOR used to have no effect, so its default changes from 1 to **0 (off)** and default behaviour stays the same.
- **Per-group factors `-t/--translation-penalty`, `-r/--rotation-penalty`, `-z/--zoom-penalty`, `-s/--shear-penalty`** (default 1) follow the `@nonlin` convention, where the global FACTOR multiplies absolute/membrane/bending/lame. The precision of each group is **FACTOR × its group factor**. FACTOR alone gives λ I, as before. FACTOR = 0 means no penalty, whatever the group factors. Example: `@affine affine 2 -r 3 -s 7` gives precisions t=2, r=6, z=2, s=14.
- **`AffineModel.penalty`** accepts the same three forms as on master, now fixed and cached:
  - a scalar λ, meaning P = λ I;
  - a per-parameter vector. It can be given in the model's basis, or in another basis (recognised by its length), in which case it is mapped group by group: an isotropic zoom is broadcast and anisotropic zooms are averaged;
  - a dict of per-group precisions with keys `translation`/`rotation`/`zoom`/`shear` (also `t`/`r`/`z`/`s`/`sh`, and `scale` for zoom). Groups left out get precision 0. The CLI passes the effective precisions (FACTOR × group factor) as this dict.
- Each parameter's group comes from the structure of its Lie generator, so indices are right for every basis in 2D and 3D. Bug fixes:
  - the dict branch checked `_penalty_list` instead of `_penalty`, so a dict penalty never took effect;
  - the per-parameter vector was never cached. It is now cached, and the cache is cleared by the setter, by `switch_basis`, and when dtype, device or dimension change.
  - Negative precisions are rejected.
- **`PairwiseRegisterStep._affine_penalty`** handles a diagonal P. With `-g`, the gradient gets Mᵀ(P ⊙ q) and the Hessian gets Mᵀ diag(P) M; for a scalar these reduce to λMᵀq and λMᵀM. As fixed in #149, `print` adds the penalty to the objective once. The `Parameters` argument that `fit` passes in is handled by master's fix, which this branch now includes through a merge.

## Tests
New `nitorch/tests/test_register_affine_prior.py`:
- FACTOR is parsed (default 0) and reaches the model through the CLI; scalar semantics.
- Group factors: parsing (default 1, short and long forms). Through `_cli`, the effective precision equals FACTOR × group factor at the right indices (affine, similitude and rigid bases). FACTOR = 0 gives no penalty. With all group factors at 1 the penalty is the scalar FACTOR, as before.
- Dict penalties map to the right indices for every basis in 2D and 3D, including short keys and partial dicts; bad keys are rejected.
- Vector penalties, including mapping across bases and rejecting a bad length or negative values.
- Cache invalidation.
- Value, gradient and Hessian are ½λ‖q‖², λq and λI, and match the M forms under `-g`.
- The objective's gradient matches finite differences with a scalar P and with a non-uniform P, with and without `-g`, for both the affine-only and joint steps; the penalty is counted once.
- λ = 0 or None gives bitwise-identical results.
- In an end-to-end registration, a large λ shrinks the estimate toward identity.

`test_register_parser.py`: group factor defaults and parsing. The original list-form test in `test_register_symmetric.py` (`[2.] * 12`) is restored.

`test_register_affine_prior.py` + `test_register_parser.py` + `test_register_symmetric.py`: 112 passed, 2 skipped.

Part of #114

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41cd61e7dd0c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.