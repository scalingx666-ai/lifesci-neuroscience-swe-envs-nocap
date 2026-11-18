# Issue

**Title:** simplereg: register the command and make it an affine + nonlinear registration

## Description

Part of #171. As decided, `simplereg` now runs affine + nonlinear, and `affreg` stays affine-only.

### Commit 1: register the command (0b6cb9b)
- `simplereg` was never imported in `nitorch/cli/registration/__init__.py`, so `nitorch simplereg` answered "Unknown command". It is now imported like the other commands.

### Commit 2: affine + nonlinear (9225717)
`simplereg` is a thin front-end: the new `build_register_args(options)` builds a `register` command line. `register` itself is unchanged.

| simplereg | register |
|---|---|
| `-m`/`-f`/`-i`, `-x`, `-r` | `@@mov`/`@@fix` with `-a init`, `-o moved`, `-r resliced` |
| `--fwhm`, `--pad`, `--bound`, `--order`, `--rescale`, `--discretize` | `-f`, `-z`, `-b`, `-n`, `-s`, `-d` on both images (only when given) |
| `-l`, `-k`, `-s` | `@loss`, `-p`, `--symmetric` (`emmi` accepted) |
| `-a`, `-o`, `-z`, `-n`, `-t`, `--line-search` | `@affine rigid\|affine -o …` with `@@optim` |
| `--nonlin svf\|shoot\|smalldef` (default `svf`), `-w`, `--penalty` | `@nonlin NAME [FACTOR] -o …` |
| `--absolute`, `--membrane`, `--bending`, `--lame` | `-a`, `-m`, `-b`, `-l` on `@nonlin` (only when given) |
| `--nonlin-optimizer gn\|lbfgs`, `--nonlin-iter` | nonlinear `@@optim` |
| `--outer-iter` | `@optim interleaved -n` |
| `-p` / `--no-pyramid` | `@pyramid --levels` / level 0 only |
| `--no-affine` / `--no-nonlin` | drop that group; giving both is an error |

- **Defaults.** The help shows `register`'s own defaults. A test checks them by running the generated arguments through `register`'s parser.
- **Affine optimiser.** Powell for `nmi`, as in `affreg`. Otherwise `register` chooses the optimiser.
- **Outputs.** `{dir}/{affine name}.lta`, `{dir}/{nonlin name}.nii.gz` (e.g. `svf.nii.gz`), `{base}.moved{ext}`, and the resliced image with `-r`. As with `register`, `fix.moved` is also written.

**Not implemented from the old help** (both remain possible with `nitorch register`):
- Several `-m`/`-f` pairs with per-pair options. `register` takes several `@loss` groups, but `simplereg` would need extra logic to spread per-pair options across them.
- Preprocessing that differs between the moving and fixed images. `--fwhm` now applies to both.

### Docs
- `simplereg.md` is rewritten. It covers the equivalent `register` command, the outputs, option tables, examples and a `reslice` chain.
- The registration index, CLI index, registration tutorial and the "See also" line in `affreg.md` are updated. `affreg` is still described as affine-only.

### Tests
- `nitorch/tests/test_cli_simplereg.py` has 8 tests, which pass in about 7 s:
  - the command is registered;
  - `-h` works;
  - the generated `register` arguments, with defaults and with overrides;
  - `--no-affine` / `--no-nonlin`;
  - `--no-pyramid`;
  - a smoke run on two 12³ images that checks the `.lta`, the warp, the resliced image and `mov.moved`.
- `pytest -k "simplereg or affreg or register"` over `nitorch/tests`: 1008 passed, 39 skipped.

**Unrelated problems found here, not changed:** `affreg` passes `max_iter`/`tolerance` to `register` as numbers rather than strings, and its `except Exception` handler is commented out.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa6vBGMPWQMVRQtfkuf

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bfb5c3c610a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.