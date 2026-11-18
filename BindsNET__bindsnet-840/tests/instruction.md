# Issue

**Title:** LocalConnection1D/2D/3D: accept a given w and per-weight bounds

## Description

## What this changes and why

`LocalConnection1D`, `LocalConnection2D` and `LocalConnection3D` crashed in their constructors in two cases:

- **A given `w`** raised `AttributeError: ... has no attribute 'out_channels'`. The shape check used
  `self.out_channels`, which these classes never set; the random-`w` branch next to it uses `self.n_filters`.
  The check now uses `self.n_filters`.
- **Per-weight `wmin`/`wmax`** (a tensor the size of `w`, which `AbstractConnection` accepts) raised
  "Boolean value of Tensor with more than one value is ambiguous". The bound check was
  `if self.wmin != -np.inf or self.wmax != np.inf`, without `.any()`. It now has `.any()`, as in the other
  connection classes.

The docstrings of the three classes now say `wmin`/`wmax` may be a tensor, as the other classes' do.

## Checklist

- [ ] I ran `poetry run pytest` locally and it passed. (653 passed, on a machine with CUDA)
- [ ] If I fixed a bug, this test fails on `master` and passes with my change
      (checked by the `bug-test` check):
      `test/network/test_connections.py::test_local_connection_nd_given_weights_and_per_weight_bounds`
      (given `w`, scalar and per-weight bounds, then 20 steps of PostPre learning; fails on `master` with
      the `out_channels` error) and
      `test/network/test_connections.py::test_local_connection_nd_random_weights_within_per_weight_bounds`
      (per-weight bounds without `w`; fails on `master` with the "ambiguous" error).
      One case per class for each. Locally the `bug-test` script reports **Passed**.
- [x] I did not remove tests, remove checks, add skips or xfails, or widen tolerances.
      (`weakened_tests.py` locally: nothing found.)
- [ ] If I changed a formula: not applicable (a shape check and a condition).
- [ ] Does this change simulated results (spikes, voltages, traces, weights)?
      - [x] No. Both cases crashed before, so no working code changes.
- [ ] Did any of these files change? No.
- [x] I added an entry to the `Unreleased` section of `CHANGELOG.md`.

## AI assistance

- [ ] No AI tools were used.
- [X] AI tools were used, and I (a human) have read every changed line, run the tests myself, and can explain the change in my own words.

Tools used and for which parts: Claude Code found both crashes while testing the GPU-bounds fix (#837),
wrote the fix, the tests and the changelog entry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f06ef797d043`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.