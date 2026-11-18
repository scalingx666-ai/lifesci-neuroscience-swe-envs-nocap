# Issue

**Title:** Create wmin/wmax on the device of the given weights

## Description

## What this changes and why

A connection built from weights already on a GPU (`Connection(..., w=w_cuda, wmin=0.0, wmax=1.0)`)
failed in its constructor with `Expected all tensors to be on the same device, but got min is on cpu`.
`AbstractConnection.__init__` always created `wmin` and `wmax` on the CPU, and the subclass
constructors clamp the given `w` against them. The bounds are now created on the device of the
given `w`. Without `w` the weights start on the CPU, and so do the bounds, as before.
Reported on Intel XPU (Aurora); the same error happens on CUDA.

Casting the bounds to `float` avoids the error only for single-value bounds; per-weight bounds
(a tensor the size of `w`, which the docstring allows) cannot be cast. This fix covers both.

## Checklist

- [ ] I ran `poetry run pytest` locally and it passed. (644 passed, on a machine with CUDA)
- [ ] If I fixed a bug, this test fails on `master` and passes with my change
      (checked by the `bug-test` check):
      `test/network/test_connections.py::test_connection_from_gpu_weights_clamps_and_learns_on_gpu`
      It needs CUDA, so on CI (no GPU) it is skipped and `bug-test` cannot see it. On a CUDA
      machine both parameter cases fail on `master` with the device error and pass with the fix.
- [x] I did not remove tests, remove checks, add skips or xfails, or widen tolerances.
      The new GPU test carries `skipif(not torch.cuda.is_available())`, like
      `test_windows_and_maxpool_state_stay_on_gpu` in the same file.
- [ ] If I changed a formula: not applicable.
- [ ] Does this change simulated results (spikes, voltages, traces, weights)?
      - [x] No. Only the device of the bounds changes, and only when `w` is given.
- [ ] Did any of these files change? No.
- [x] I added an entry to the `Unreleased` section of `CHANGELOG.md`.

## AI assistance

- [ ] No AI tools were used.
- [x] AI tools were used, and I (a human) have read every changed line, run the tests myself, and can explain the change in my own words.

Tools used and for which parts: Claude Code reproduced the bug, wrote the fix, the tests and the
changelog entry.

## Not in this pull request

`Conv1dConnection`, `Conv2dConnection`, `Conv3dConnection` and `MeanFieldConnection` clamp a given
`w` only when a bound is infinite (`(self.wmin == -inf).any() or (self.wmax == inf).any()`), the
reverse of `Connection` (`!=`). With finite bounds a given `w` is never clamped. Fixing it changes
results for anyone passing out-of-range weights, so it belongs in its own pull request.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `314c33419ab1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.