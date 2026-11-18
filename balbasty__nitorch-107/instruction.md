# Issue

**Title:** FIX(register): honour parsed-but-ignored options

## Description

## Summary

Part of the `nitorch register` audit fixes (group H: options that are parsed but then ignored or broken).

- **`@@optim gn -m/--marquardt`**: the parser default (`None`) turned Levenberg-Marquardt off, even though the help says `[auto]`. The default is now `True` (auto), `-m auto` is accepted, and `-m 0` still turns it off. For the affine `GaussNewton`, a numeric value was added to **every** entry of the full `(N, N)` Hessian. It is now added to the diagonal only. The grid solvers already used diagonal-first compact storage and were correct. Side effect: a rigid GN registration of a 2D image (out-of-plane parameters, zero Hessian) used to fail with `linalg.solve: ... singular` and now runs.
- **`@@fix/@@mov -n/--order`**: was never used. The warped and resliced outputs were always resampled with order 1. It now reaches `grid_pull`.
  - Intensity images are resampled with `prefilter=True`, so order > 1 interpolates instead of smoothing. This is a no-op for order ≤ 1.
  - Label maps (`-l`, or integer data) keep `prefilter=False`: with order > 1, the spline weights vote between labels.
  - `warp_one_image` gains a `label` argument, which `warp_images` sets from `fix.label` / `mov.label`.
- **Loss options** `-j/--joint` (mad, tuk), `--stride` (lcc, lgmm) and `-n/--order` (mi, ent) were missing from `losskeys` in `cli.build_losses`, so they never reached the loss objects. They are now passed through, and `order` is mapped to the loss's `spline` argument.
  - The parser default for the histogram order stays `[3]`, and the help now says `[3]` (it said `[1]`). Gauss-Newton with MI or entropy at order 3 relies on #115 (merged).
  - affreg's default NMI + Powell run only converges at order 3 with a small initial Powell step. Before #110, the inherited `-l 1` gave a first trial rotation of 1 rad and the run ended near a 180° flip. With #110 merged (`-l` defaults to None, so Powell keeps its own 0.02 step), `test_affreg_default` passes and no affreg-specific change is needed.
- **`nes`/`ogm -r/--restart`**: used `convert=bool`, so `-r 0` and `-r false` both gave `True`. It now uses `bool_or_str`. The value also never reached the optimizer, which expects `auto_restart`; it is now renamed on the way. `ogm --relax` is renamed to `relaxation` the same way.
- **Nonlin GN `-g/--fmg`**: `make_nonlin_optim` popped this value and never forwarded it, so the solver always used `fmg=2`. It is now forwarded.
- **Help text** (help3): documented defaults and option names now match the parser:
  - mi: fwhm `[0]`, order `[3]`
  - lcc/lgmm: `--stride [1]` (the `-s` short flag is taken by `--symmetric`); lcc stride and kernel are now listed; master's patch unit and FWHM note are kept
  - gmm/lgmm: `--max-iter`
  - `--steps [8]`; interleaved `--max-iter [5]` and `--tolerance [1e-5]`; the stray `]` after lame is removed
  - default solver: LBFGS (not Nesterov) for losses without a Hessian
  - `--sub-iter`: 2 per FMG cycle, 16 without FMG; `-g/--fmg` is now listed
  - `-h` levels are 1, 2, 3; `-v` levels; `-r/--framerate` is now listed
  - `@affine FACTOR` currently has no effect (see below)

## Tests

New `nitorch/tests/test_register_options.py`, 32 tests:
- Marquardt only loads the diagonal; parser and `make_*_optim` give the auto default, `auto`, `0.5` and `0`; end-to-end `_cli` rigid GN on a 2D image.
- nes `-r` value and parse, and `auto_restart` on the affine and nonlin optimizers; nonlin GN `-g` reaches `fmg` and sets the sub-iterations.
- Through `cli.build_losses` with small NIfTI files: MI `order` gives `spline` (default `[3]`, and `-n 2`); mad/tuk `joint`; lcc/lgmm `stride`.
- `warp_images` honours `order` for the fixed and the moving image (order 0 gives no interpolated values, order 1 does).
- An intensity image resliced with order 3 under the identity reproduces the input (atol 1e-5; without prefiltering the error is about 0.44). A label map resliced with order 3 stays integer and only contains its labels.

On `origin/master`, most of these tests fail. On this branch, all `nitorch/tests/test_register_*.py` pass (171) at master 4d165d4. After also merging #119 (0746392), `test_register_{options,misc,init_reslice,parser}` give 61 passed.

## Found, not fixed here

- **`-d/--dim` (stopped: needs redesign)**: `dim = 3` is hard-coded in `cli._main` and `build_losses`. Honouring `-d 2` needs several changes: cut the affine down to 3x3 in `map_image` (NIfTI affines are always 4x4, which gives `mat1 and mat2 shapes cannot be multiplied (3x3 and 4x4)` in `do_affine_only`), and embed 2D transforms back into 4x4 for `.lta` output (`Expected a batch of 4x4 matrix`), nonlin output and warped output. Help text left unchanged.
- **`@affine FACTOR` (stopped: needs a design decision)**: `AffineModel.factor` is never used, and no affine penalty exists by default (`_penalty = penalty or None`), so the factor has nothing to scale. Making it work means picking a default affine penalty. The help text now says it currently has no effect. Separately, `Affine2dModel.__init__` passes `(basis, factor, penalty, dat, position)` positionally, so `dat` lands in `optim`. This is harmless today.
- The `nes`/`ogm -o/--output` momentum-map option is parsed but not implemented.
- `@@fix/@@mov --order` only affects the written outputs. During optimisation, images are still interpolated with order 1, because `Image`/`ImagePyramid` have no order setting.
- The emmi symmetric path calls `load_image(**loss.fix)`, which does not accept those keyword arguments.
- Note on label maps: for integer inputs, nitorch's `grid_pull` with order > 0 picks the label with the largest weight rather than averaging values, so label maps were not literally averaged before this change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0746392d0d36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.