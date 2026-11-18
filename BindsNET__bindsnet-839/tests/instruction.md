# Issue

**Title:** Clamp a given w to finite bounds in Conv1d/2d/3d and MeanField connections

## Description

## What this changes and why

`Conv1dConnection`, `Conv2dConnection`, `Conv3dConnection` and `MeanFieldConnection` never clamped a `w`
passed to the constructor when both bounds were finite. The given-`w` branch tested
`(self.wmin == -inf).any() or (self.wmax == inf).any()`, the reverse of `Connection` (`!=`): it clamped
only when a bound was infinite, where clamping does nothing. The four conditions now use `!=`.
The branches for `w=None` were right and are unchanged.

## Checklist

- [ ] I ran `poetry run pytest` locally and it passed. (648 passed, on a machine with CUDA)
- [ ] If I fixed a bug, this test fails on `master` and passes with my change
      (checked by the `bug-test` check):
      `test/network/test_connections.py::test_given_weights_are_clamped_to_finite_bounds`
      (one case per class; all four fail on `master`)
- [x] I did not remove tests, remove checks, add skips or xfails, or widen tolerances.
- [ ] If I changed a formula: not applicable (a condition, not a formula).
- [ ] Does this change simulated results (spikes, voltages, traces, weights)?
      - [x] Yes, only for code that passes these classes a `w` outside finite bounds: its starting
            weights are now clamped. The golden files did not change and were not regenerated:
            no golden network, built-in model or example passes such weights. The ANN-to-SNN
            conversion passes `w` with no bounds and behaves as before. The "Results changes"
            entry is in `CHANGELOG.md`.
- [ ] Did any of these files change? No.
- [x] I added an entry to the `Unreleased` section of `CHANGELOG.md`.

## AI assistance

- [ ] No AI tools were used.
- [X] AI tools were used, and I (a human) have read every changed line, run the tests myself, and can explain the change in my own words.

Tools used and for which parts: Claude Code found the reversed condition while testing the GPU-bounds
fix, wrote the fix, the test and the changelog entry.

## Why the results changed

Before, `Conv2dConnection(..., w=w, wmin=0.0, wmax=1.0)` kept every value of `w`, including values
outside `[0, 1]`. A learning rule clamped them at its first update (`LearningRule.update`); without a
learning rule (`NoOp`) they stayed out of range for the whole run. Now they are clamped at
construction, as `Connection` does.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2452c4ef6df0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.