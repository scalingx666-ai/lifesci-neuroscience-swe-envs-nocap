# Issue

**Title:** TEST/CI: deflake TS gradcheck (nondet_tol) and skip slow tests by default

## Description

## Summary
- **Flaky gradcheck**: `test_gradcheck_spatial.py` passes `nondet_tol=1e-12` to all three `gradcheck` calls (pull/push/count, all `torch.double`). On torch 1.13 the first TorchScript backward runs unfused and later ones go through the CPU fuser, so the reentrancy check sees ~1e-16 differences (diagnosis in #117). atol/rtol are unchanged and nothing is skipped.
- **`slow` marker**: registered under `[tool:pytest]` in `setup.cfg`. A new root `conftest.py` adds `--runslow`. Without it, tests marked `slow` are skipped.
- **CI**: `test.yml` (PRs and pushes) now runs the fast set with `--durations=20`. The new `test-slow.yml` (`nitorch-test-slow`) uses the same matrix and runs `--runslow --durations=20` on push to master, weekly (Mon 04:17 UTC) and via workflow_dispatch. The TS/C gradcheck workflows are not changed.
- **Hang protection**: CI now installs `pytest-timeout` (in CI only, not added as a package dependency). Tests are capped per test: `--timeout=600` in the fast workflow, `--timeout=1800` in the slow one. Jobs are also capped with `timeout-minutes` (30 fast, 120 slow), so a hung test fails and reports its name instead of running for hours, as happened in job 124211450899 on #105.
- **README**: new "Running tests" section covering the fast suite, the slow suite and gradcheck.

Tests marked slow (each is >5 s locally, local timings in parentheses):
`test_register_gmm::test_gmm_grad_hess_fd` (269 s), `test_register_optim::{test_register_affine_ogm (33 s), test_affreg_default (23 s), test_register_affine_rotation (6.6 s), test_register_affine_powell (5.3 s)}`, `test_register_powell::{test_affreg_default_recovers_rigid (27 s), test_register_nonlin_powell_error (5.5 s)}`, `test_register_init_reslice::{test_register_com_resliced[*] (8-11 s), test_warp_images_resliced[*] (8 s)}`, `test_hist_hess_order::test_register_gn_mi_order3 (10 s)`, `test_register_patch_units::test_slicewise_loss_matches_inplane_vox (5.1 s)`. That is 11 functions, 15 test items.

Fast end-to-end smoke tests left unmarked: `test_register_powell_verbose1_in_place`, `test_powell_affine_parameters`, `test_register_init_center[*]`, the symmetric end-to-end tests (`test_affreg_symmetric_translation`, `test_register_symmetric_translation`), the patch-unit per-level tests, and `test_register_nonlin_svf_runs`.

## Tests
`pytest --ignore nitorch/tests/test_gradcheck_spatial.py`, measured locally. The container is shared, so these numbers are inflated: the whole CI Tests step on master takes 38-51 s. CI logs had no per-test durations before this PR; `--durations=20` adds them.

| run | result | wall time |
|---|---|---|
| default, before | 413 passed | 573 s |
| default, after | 398 passed, 15 skipped | 205 s |
| `--runslow -m slow --co` | 15 collected | - |
| `test_gradcheck_spatial.py -k "grid_pull and 1"` | 256 passed | 213 s |

## Notes
- When the open PRs merge, their slow tests should get `@pytest.mark.slow`. These files are not on master yet, so they are not edited here:
  - #105 / #107: the end-to-end `nitorch register` CLI runs in `test_register_preproc.py` and `test_register_options.py`.
  - #117: the end-to-end runs in `test_main.py`. In `test_ts_nd_batch.py`, any large N-D batch loops.
- `test_register_powell_verbose1_in_place` is just above 5 s locally but about 0.6 s in CI terms, so it stays unmarked as the Powell smoke test.
- The slowest test is 269 s locally, far less in CI, so the 600 s and 1800 s per-test caps leave a wide margin.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0746392d0d36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.