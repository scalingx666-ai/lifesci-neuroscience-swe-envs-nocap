# Issue

**Title:** register: chunked matmul affine_grid_backward

## Description

## Summary
This is the `affine_grid_backward` item of #158 ("go, chunked").

The affine chain rule turns the dense gradient and Hessian with respect to the displacement into derivatives with respect to the affine parameters. It did this with about 150 full-volume products and 100 reductions (TorchScript loops over matrix entries): 1.3–2.3 s at 192³, on every affine step and every line-search trial.

With `X = [grid, 1]` (one row per voxel):
- the gradient is `gradᵀ X`;
- each of the `dim·(dim+1)/2` unique Hessian blocks is `(X ⊙ hess[:, ik])ᵀ X`.

That is a handful of matmuls.

**Memory**, the concern raised in #154: voxels are processed in chunks, and the identity grid is built chunk by chunk instead of being materialised. The extra memory is therefore a few chunk-sized buffers instead of an N×3 grid plus full-volume temporaries.

The interface is unchanged: batch dimensions, a custom `grid` (which `do_affine` passes on its `'ms'` path), and `hess=None` returning `(g, None)`. The two TorchScript helpers it replaces had no other users.

## Chunk size
`AFFINE_GRID_BACKWARD_CHUNK` can still be set to override it. By default (`None`) the chunk size depends on the device:

- **CPU:** `max(2¹⁸, 2¹⁶ × threads)`, capped at 2²⁰. Measured at 192³ (ms, gradient + Hessian):

  | threads | 2¹⁴ | 2¹⁶ | 2¹⁸ | 2²⁰ | 2²² | 2²³ |
  |---|---|---|---|---|---|---|
  | 1 | 1660 | 1322 | **1267** | 1963 | 2081 | 2109 |
  | 2 | 1270 | 966 | **852** | 1573 | 1546 | 1323 |
  | 4 | 1198 | 674 | **487** | 902 | 919 | 864 |

  Small chunks pay the per-chunk overhead. Chunks of 2²⁰ and more are 1.5–2× slower, most likely because the chunk buffers no longer fit in cache. Each chunk is split across threads, so larger thread counts get larger chunks. This was **not measured beyond 4 threads**.
- **CUDA:** 2²⁰, **not measured**. A million voxels per kernel should fill a GPU, and it keeps the chunk buffers to about 100 MB.

## Effect
192³, 4-thread CPU, gradient + Hessian. Measured on two machines, since the session moved:

| | master | this PR |
|---|---|---|
| time, machine 1 | 2.29 s | 0.33 s |
| time, machine 2 | 2.75 s | 0.52 s |
| extra peak memory after warm-up (machine 1) | +27 MB | +4 MB |

Compared with master on 1D, 2D and 3D, with and without batch dimensions, with and without a custom grid, with and without a Hessian: differences are at most 5e-7 relative in float32 and 6e-16 in float64.

## Tests
- `nitorch/tests/test_affine_grid_backward.py` (new):
  - comparison with an explicit `einsum` reference (dims 1–3, batched, custom grid);
  - many small chunks with a remainder vs one chunk;
  - gradient only, and `hess=None`;
  - the chunked identity grid matches `identity_grid`;
  - the default chunk size for each device and thread count, and the override.
- Full suite (TS backend, torch 2.15): 2562 passed, 105 skipped. That run was on a master from before #171's merges; the merge with the current master has no conflicts.

Part of #158.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaUGFKHtAQeNPPDHTHh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2141ad1178f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.