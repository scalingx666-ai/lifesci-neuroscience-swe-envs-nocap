# Issue

**Title:** Fix mind bug

## Description

## Summary

Fixes `make_image(dat, mind=True)`, which currently crashes with:

```
AttributeError: module 'nitorch.core.bounds' has no attribute 'zero_'
```

## Root cause

`make_image()`'s default boundary condition (`bound='zero'`) is forwarded
through `spatial.rmind` to `nitorch.core.utils.roll`, which looks up a
`zero_` index-remapping function on `nitorch.core.bounds`. `bounds.py`
documents `zero` as one of its 7 canonical boundary conditions (see the
module's own docstring table) but only 6 of them (`replicate`, `dct1`,
`dct2`, `dst1`, `dst2`, `dft`) actually have a working implementation —
`zero` never did.

This is isolated to this one pure-Python utility; the compiled/TorchScript
grid backend (`grid_pull`/`grid_push`) already handles `bound='zero'`
correctly.

## Fix

- Adds `zero(i, n)` / `zero_(i, n)` to `bounds.py`, mirroring the exact
  contract already used by `replicate`/`replicate_`.
- That alone wasn't sufficient — it exposed a second, pre-existing latent
  bug in `utils.roll` (and the structurally identical `_pad_bound`): a
  per-dimension boundary condition that always returns a scalar sign (e.g.
  `dct2`/`replicate`) mixed with one that returns a real per-index tensor
  (now `zero`) left a bare Python `int` in the multiplier list, which
  `torch.meshgrid` rejects. Every other bound type happens to always
  return a scalar, so this was never triggered before. Fixed by wrapping
  any remaining scalar entries as a 1-element tensor before the `meshgrid`
  call.

## Test plan

- [x] New regression test reproducing the exact originally-reported crash
- [x] New unit tests on `bounds.zero`/`zero_` directly
- [x] New regression test confirming an already-working boundary condition
      (`dct2`) is unaffected
- [x] Full existing test suite passes with zero regressions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74b48d5b010d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.