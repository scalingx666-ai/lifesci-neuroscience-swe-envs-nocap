# Issue

**Title:** FEAT(cli): optinorm command (port of scripts/optinorm.bash)

## Description

## Summary

`nitorch optinorm *INPUTS` ports `scripts/optinorm.bash`. It performs an unbiased (groupwise) rigid + diffeomorphic normalisation of a few images of the same subject to their mean space. It runs the script's six steps with the same defaults:

| step | what | default |
|---|---|---|
| `aff` | pairwise affine registrations (`register`) | `lcc`, `rigid -g`, levels `:4` |
| `affopt` | optimal mean-to-image affines (+ inverses for Freeview), header-only alignment | |
| `meanspace` | mean space of the aligned images (+ resliced images for viewing) | |
| `svf` | pairwise SVF registrations, with Hessians | `-m 20`, levels `:6` |
| `svfopt` | optimal mean-to-image SVFs | Hessian-weighted |
| `norm` | reslice the inputs to the mean space | order 3, clipped |

Everything runs in one process. `register`, `reslice` and `meanspace` are called in-process, and `optimal_affine`/`optimal_svf` directly, with integer labels so their ordering is stable. Each step reads the previous steps' outputs from the output folder, so a run can be resumed with `-s STEPS`. A missing input or output stops the run with an error naming the step (`reslice` only prints its help on errors, which would otherwise go unnoticed).

**Compared with the script**, as agreed:
- **Options:** `--loss`, `--affine {rigid,similitude,affine}`, `--affine-levels`, `--nonlin-levels`, the penalties (`-a/-m/-b/-l`), `-i/--interpolation`, `--no-clip`, `-v`, `--cpu/--gpu`.
- **`--both`:** also compute the unweighted optimal SVFs. The script always computed them but never used them.
- **`--cleanup`:** delete the pairwise registrations once every step has succeeded. Everything is kept by default.
- **Naming and file handling:**
  - Pair folders are named `{i}_{j}`; the script's `{i}{j}` collides from 10 inputs on (`1,12` vs `11,2`).
  - The mean space is computed from the exact list of aligned images, not a `*.aligned.nii.gz` glob that misses `.nii` inputs and picks up stale files.
  - Duplicate input basenames are disambiguated.
- **Fewer files:** the unused `*.moved` images of every pairwise registration are not written.
- `scripts/optinorm.bash` is left unchanged.

## Two fixes in `spatial` this depends on (separate commits)
- **`optimal_svf` without weights** (also used by `nitorch vopt` without `-w`):
  - It crashed, because the uniform weight was passed to the solver as a scalar instead of a Hessian field.
  - Once that was fixed, its least-squares fit was wrong. The pairwise system has a null space (adding the same field to every subject); in float32 its singular value is about 1e-7, which `rcond=1e-15` doesn't cut, so precision was lost. Exactly consistent pairs were recovered with errors around 1.
- **`optimal_affine`** (used by `nitorch affopt`) had the same `rcond` problem in its log-Euclidean fit. The default matrix-space refinement then started from a bad point and converged to a wrong solution. On exactly consistent rigid pairs, pairwise errors were 0.105 (3 images) and 0.303 (6 images) before, and 0.005 / 0.004 after.

## Testing
**Synthetic data:** 3 copies of a smooth 32³ phantom, each with a different small rotation/translation in its header and a different smooth nonlinear warp of its voxels, run with `--affine-levels :2 --nonlin-levels :2 --both`. Mean pairwise correlation in the mean space:

| | correlation |
|---|---|
| no transform | 0.155 |
| after rigid (`aligned.resliced`) | 0.818 |
| after rigid + SVF (`norm`) | 0.977 |

The optimal SVFs sum to zero (max |Σ| = 6e-8).

**Same data through `scripts/optinorm.bash`** (pyramid levels set to `:2`, and `-v 2` set to `-v 1` because level 2 opens interactive plots), on the same code:
- Pairwise affines are identical. The optimal affines, their inverses and the mean space agree to about 1e-7.
- Final alignment is the same: correlation 0.977 (optinorm) vs 0.976 (script). Runtime is 3m53s vs 5m32s.
- The pairwise SVFs differ by up to 0.39–0.73, entirely because of those ~1e-7 affine differences (float operations happen in a different order). Rerunning `register` on either run's inputs reproduces that run's SVFs exactly, and both command lines give bitwise-identical SVFs on identical inputs. So nonlinear `register` is very sensitive to its affine inputs on this small phantom; the port itself doesn't change the result.

**`nitorch/tests/test_optinorm.py`** (about 50 s; the end-to-end test takes about 40 s):
- parser defaults and options;
- output naming (pair separator, duplicate basenames);
- `optimal_svf` with consistent pairs, weighted and unweighted;
- `optimal_affine` with consistent pairs, 3 and 6 images;
- an end-to-end run on two 24³ images with `--both --cleanup`, which checks the outputs, the cleanup, and that alignment improves after rigid and again after nonlinear registration.

The three consistent-pairs tests that depend on the fixes fail without them. The full suite (`nitorch/tests` + `nitorch/io/tests`, excluding gradcheck) passes on this branch merged with current master: 423 passed.

---
_Generated by [Claude Code](https://claude.ai/code/session_014dBjaSE7XNeP7n5m7KZsaM)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0746392d0d36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.