# Issue

**Title:** FIX(core): batched TorchScript splines, escape-sequence warnings, python -m nitorch

## Description

## Summary
Part of #114.

- **TorchScript `nd` splines (order >= 2) on batched grids** (`nitorch/_C/_ts/nd.py`): `pull`, `push`, `grad`, `pushgrad` and `hess` all failed when batch > 1. The per-voxel weights and indices had shape `[B, N]`, which does not broadcast against `[B, C, N]`. A batch-1 input was also never expanded to the grid's batch size. The fix adds a channel dimension to the grid before the weights are computed and expands the input to the full batch. Batch-1 outputs are bitwise unchanged. This fixes slicewise MI with `spline >= 2`.
- **`nd.hess` was wrong**: one buffer was multiplied in place across every diagonal and off-diagonal term, so each term picked up the weights of the previous ones. Each term now starts from a fresh copy. The out-of-bounds mask is now broadcast against `(D, D)`.
- **Spline derivatives** (`nitorch/_C/_ts/splines.py`): `fastgrad` for order 1 had the wrong sign (this matters when orders are mixed, e.g. `[1, 3]`, which goes through `nd`). The two pieces of `fasthess` for order 2 were swapped.
- **`SliceWiseLoss`** now infers `dim` from the input when neither `dim=` nor the base loss sets it. It used to fail on `None - 1`.
- **`nitorch help <unknown>`** printed the help function object instead of calling it.
- **`SyntaxWarning: invalid escape sequence`**: changed strings to raw strings or escaped the backslashes in `_C/_ts/pushpull.py`, `_C/solve.py`, `core/linalg.py`, `mesh/_mbf.py` and `mesh/_svg_allen.py`. The string values are unchanged.
- **`python -m nitorch`**: new `nitorch/__main__.py` that runs `sys.exit(nitorch.cli.cli())`, the same function as the console script.
- Merged master (includes #115).

## Tests
- `nitorch/tests/test_ts_nd_batch.py`:
  - Batched output matches a loop over batch elements for all 5 nd functions, orders 2 and 3, bounds dct2/dft/zero, 2D and 3D, input batch 1 and 3.
  - `nd.hess` matches finite differences of `nd.grad` for orders 1–3, 2D and 3D.
  - `nd.grad` of order 1 matches `iso1`.
  - Slicewise `MI(spline=3)`: value, grad and Hessian are finite and equal the per-slice results, with `dim` not given anywhere.
  - The 19 Hessian and order-1 tests fail on master.
- Bitwise check against master for batch 1 (1D/2D/3D, all 5 functions): identical.
- `test_gradcheck_spatial.py`, full file (pull, push and count, 1008 tests), TS backend: 1008 passed on torch 2.15, and 1008 passed on torch 1.13.1 with Python 3.9.
- `test_register_mi.py` and `test_main.py` pass.
- `python -W error::SyntaxWarning -m compileall nitorch`: clean.

## About the earlier `test_gradcheck_grid_pull` CI failure (torch 1.13.1)
The failure was "Backward is not reentrant" with `nondet_tol=0`. It is not caused by this PR, and it also happens on master.
- On torch 1.13.1, the **first** backward call through the TorchScript functions differs from later calls by about 1e-16: the profiling run is unfused, and after it the CPU texpr fuser takes over.
- Turning off the profiling executor or the CPU fuser makes the backward bitwise reentrant.
- The test data are random and unseeded, so the test fails intermittently.
- A full run of a pristine master checkout on torch 1.13.1 failed `grid_pull[sixth-dst2-1D]` the same way, while the branch passed 1008/1008.
- The pushpull-TS workflow is path-filtered, and it has no completed run on master.

## Found, not fixed here
- The fuser-induced non-reentrancy above. Possible remedies: seed the test data, warm up before `gradcheck`, or turn off CPU fusion in the TS backend for old torch.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d42b599f6fd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.