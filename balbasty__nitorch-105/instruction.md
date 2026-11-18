# Issue

**Title:** FIX(register): rescale min quantile, mm pad/fwhm, @pyramid -c

## Description

## Summary
- `--rescale MN MX` with MN != 0 gave an all-NaN image. `rescale_image` converted only MX from percent to a fraction; MN is now converted too.
- `--pad`/`--fwhm` with an `mm` suffix crashed. `preproc_image` read the voxel size from the list of input transforms instead of the image affine `affine0`.
- `@pyramid -c` crashed. Fixed in two places:
  - Parser: the option was declared as `'-c-'` with `nargs=1`. It is now a `-c`/`--concurrent` flag that also accepts an optional bool value.
  - `cli.py`: the loss `order` lookup now handles the concurrent (flat) layout, and the per-level loss factor index is clamped in the concurrent branch, on top of master's `owners` list.
- `_expm` (`nitorch/core/_linalg_expm.py`) now stops its Taylor series when a term is non-finite. Before, NaN input never met the tolerance, so every call ran all 10000 orders. That is what made CI on py3.12/torch 2.5.1 hang.

#112 already covered the other parts of the `-c` crash: `concurrent_pyramid.get_level` recursing into `Similarity`, and the operand order in `Similarity`/`SumSimilarity.__truediv__`. Master's versions are kept here; this PR no longer duplicates them.

### Where the NaN came from
The first version of the end-to-end test used a binary cube on a zero background. Because zeros count as missing (`missing=0`), only 48 voxels inside the cube were kept, and there the residual is about 0. MSE estimates its weight as 1/mean(r²), which became about 2e14 here and inf/NaN on some platforms. That produced NaN affine parameters, and `_expm` then ran its full 10000-order series on every line-search evaluation. The test now uses a noisy, non-zero background.

## Tests
`nitorch/tests/test_register_preproc.py`:
- rescale with MN != 0, pad in mm, fwhm in mm
- parsing of `@pyramid -c`
- an end-to-end CLI run with `@pyramid -c` (about 1s)
- `_expm` on NaN input returns NaN quickly (about 1ms with the guard, about 0.3s without)

Under py3.12 + torch 2.5.1 (CPU, TS backend), these pass together with `test_register_parser.py`, `test_register_patch_units.py`, `test_register_symmetric.py`, `test_register_misc.py` and `test_linalg_logm.py` (85 passed, 1 skipped).

## Found, not fixed here
- `concurrent_pyramid` divides by `level + 1`, but `level` is already the number of levels, so the normalisation looks off by one.
- MSE's estimated precision (1/mean r² inside the mask) has no lower bound on the residual. A near-perfect match inside a small mask gives inf/NaN.
- The optimiser and line search do not reject non-finite losses or steps.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ba3b809311d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.