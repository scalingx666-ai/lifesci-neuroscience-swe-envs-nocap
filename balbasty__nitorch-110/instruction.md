# Issue

**Title:** FIX(register): misc CLI crashes and defaults

## Description

## Summary
- **`@optim sequential`**: now has its own `-n/--max-iter` (default 1) and `-t/--tolerance` (default 0) options, listed in the help. `cli.py` reads `options.optim.max_iter` / `.tolerance` directly. Before this change, the run crashed with AttributeError.
  - In sequential mode, one iteration means a full affine fit followed by a full nonlinear fit. The defaults give a single such pass, which is what the old code always did.
  - `build_joint_optim` used to hard-code `max_iter=1, tol=0` for sequential mode and ignore any value passed in. It now applies a value only when one is given (`None` picks the per-mode defaults: interleaved 10 / 1e-5, sequential 1 / 0). `run()` defaults to `None` as well, so library callers that pass nothing see no change.
- **`-l/--lr`**: now defaults to unset (`None`), so the documented fallback applies: 1 for second-order optimisers, 1e-3 for first-order ones. Powell now uses its own default step (0.02) rather than 1 rad.
- **`LBFGS.__init__`**: `lr` is now its first argument. Before, the positional `cls(lr, ...)` call in `pairwise_makeobj` set `max_iter` instead.
- **`Image.get_center()`**: now uses a floating dtype for integer (label) images. Before, the affine was truncated or a RuntimeError was raised.
- **`-i fov|com`**: each loss is now weighted by the voxel count of its images. Before, every weight was 1. `torch.eye(4)` is unchanged.
- **`warp_one_image(reslice=True)`**: now uses an identity transform when there is neither an affine nor a nonlinear transform. This is merged with master's symmetric-only squaring fix from #106.

## Tests
- `nitorch/tests/test_register_misc.py` has 9 tests, covering sequential parsing, a user's value reaching `run()`, `build_joint_optim` pass counts, lr default, LBFGS, get_center, fov weights and identity reslice.
- The full `pytest nitorch/tests` run gave 1374 passed and 1 failed. The failure was `test_register_affine_powell`, caused by this branch's lr change; that is fixed in the latest commit. `test_register_optim.py` and `test_register_misc.py` were re-run after the fix and pass (16 passed).

## Found, not fixed here
- None remaining. (The reslice condition was fixed on master by #106.)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10e9be9ba462`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.