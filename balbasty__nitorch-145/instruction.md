# Issue

**Title:** FIX(register): make square-kernel local_mean backward the adjoint of forward

## Description

## Problem

The backward (transposed) pass of the square-kernel local mean (`local_mean(..., mode='c'/'s', backward=True)`) was broken. LCC and LGMM use it to compute gradients with `--kernel square`, so their gradients were wrong with that option. In `nitorch/tools/registration/losses/utils_local.py`:

1. `do_patcht` allocated its output with the spatial shape only, missing the batch/channel dimensions, so it raised an `IndexError` in `unfold(d+2, ...)`.
2. It wrote into overlapping `unfold` views with `copy_`. When stride < kernel size (including the default stride 1), overlapping patch contributions overwrote each other instead of adding up.
3. In backward mode, `local_mean` clamped the square kernel to the size of its (patched) input instead of the forward input shape `shape`. When the kernel was large enough to be clamped, the backward pass used a different kernel from the forward pass.

## Changes

Both directions of the square-kernel mean still use only views and reductions, with no convolutions. They are now applied one dimension at a time, since the box kernel is separable:

- `do_patch` (forward): one `unfold(...).mean(-1)` per dimension, instead of one `unfold` over all dimensions followed by a mean over `prod(kernel_size)` values. Each voxel now costs `sum(kernel_size)` operations instead of `prod(kernel_size)`.
- `do_patcht` (backward), per dimension, writing into an unfolded view of a zero-initialised output:
  - stride ≥ kernel (non-overlapping windows): each value is broadcast into its window with `copy_`, as the original code intended;
  - stride < kernel (overlapping windows): one strided `add_` per window offset `j` (`z.select(-1, j)`), so overlapping contributions add up;
  - trailing voxels that no forward patch covers stay zero.

  This is the exact adjoint of `do_patch` for any kernel size and stride.
- In backward mode, `local_mean` clamps the square kernel against `shape`.
- The unused `patcht_output_padding` helper is removed.
- The Gaussian path is unchanged.

Timings on CPU (4 threads, float32, batch × channels = 6):

| shape | kernel | stride | forward before | forward after | backward |
|---|---|---|---|---|---|
| 96³ | 9 | 1 | 2346 ms | 33 ms | 67 ms |
| 96³ | 9 | 2 | 281 ms | 7 ms | 39 ms |
| 96³ | 5 | 1 | 785 ms | 16 ms | 55 ms |
| 256² | 9 | 1 | 19 ms | 2.2 ms | 1.6 ms |

The old backward pass has no "before" column because it raised an error. A convolution-based backward (an earlier commit on this branch) was 2–9× slower than the view-based one. Accuracy against a float64 reference is the same for all methods (about 1e-7 relative error in float32).

## Tests

- `test_local_mean_backward_is_adjoint`: removed the `xfail(strict=True)` on the square-kernel case. The test now covers square kernels in 1D/2D/3D with strides of 1, 2, equal to the kernel and mixed, plus a clamped-kernel case, each with and without a mask. Without the fix, 22 of these cases fail.
- The new code still compiles under TorchScript (`torch.jit.script(local_mean)`), stays adjoint, and gives the same forward output as eager mode.
- `pytest nitorch/tests/test_register_*.py`: 725 passed, 18 skipped.
- Finite-difference gradient check with a square kernel: LCC matches to about 1e-8 at strides 1 and 2, and LGMM with `bins=1` matches to about 2e-8.

Note: with `bins>1`, LGMM gradients differ from finite differences for the Gaussian kernel as well, by even more than for the square kernel, so that mismatch comes from the EM fitting step, not from this change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaVKEgNYNsXwRvH7RfF

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e60f9e4ae067`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.