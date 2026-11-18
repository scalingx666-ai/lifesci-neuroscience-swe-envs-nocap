# Issue

**Title:** Fix stale diameters overwriting 3-d points on a diam write (C API, HOC, Python)

## Description

I pointed claude at #3863 and this is the first of two PRs that should fix it. I read through these changes, and they look fine to me.

---

Part of #3863.

Before: if you wrote one segment's diameter on a section with 3-d points before anything had read its diameters, for example right after `pt3dadd`, the other 3-d points' diameters were replaced by 500 µm, NEURON's default. This happened with HOC `sec.diam(x) = d` and `sec.diam(a:b) = d1:d2`, with Python `sec(x).diam = d`, and with the C API's `nrn_rangevar_set`.

After: such a write changes only the 3-d points in the written segment, and the result is the same whether or not anything read diam first.

## Example

Three 3-d points 10 µm apart, all diam 3, nseg = 3, then `diam(0.5) = 42`:

| | 3-d diameters | segment diameters |
|---|---|---|
| before, fresh section | 500, 42, 500 | 347.3, 118.3, 347.3 |
| before, diam read first | 3, 42, 3 | 16, 35.5, 16 |
| after, either case | 3, 42, 3 | 16, 35.5, 16 |

## Why it happened

After `pt3dadd`, a section's segment diameters are derived from its 3-d points only at the next area recompute (the section's `recalc_area_` flag). Until then, each segment holds its old diameter, which for a new section is the 500 µm default. Every diam write ends with `nrn_diam_change`, which copies each segment's diameter into the 3-d points that lie in it (as the `pt3dconst` documentation describes). So the untouched segments' stale 500s were copied over the diameters given to `pt3dadd`.

## The fix

Before writing a segment diameter on a section with 3-d points, finish the pending recompute with NEURON's existing `nrn_area_ri`. The getters already do this (`seg.diam` in Python, `nrn_segment_diam_get`), and HOC already did it for compound assignments such as `diam(x) += d`. No formulas change; the existing recompute runs earlier. Sections without 3-d points are not affected, and neither is whole-section `sec.diam = d`, which writes every segment. `nrn_rangevar_set_nothrow` already recomputed before writing.

This changes results for HOC and Python models that set a segment diameter on a fresh 3-d section before anything read it. Those models had been silently given 500 µm diameters, so the old results were wrong.

## Commits

1. **C API:** `nrn_rangevar_set` (for diam).
2. **HOC:** `range_interpolate_single` (`sec.diam(x) = d`) and `range_interpolate` (`sec.diam(a:b) = d1:d2`) in `cabcode.cpp`.
3. **Python:** the segment setter (`sec(x).diam = d`) in `nrnpy_nrn.cpp`.

## How it was tested

Each test compares a write on a fresh section with the same write on an identical section that was read first. It also checks that the unwritten 3-d points keep their 3 µm.

- `test/api/diam3d_pending.cpp` (new): `nrn_rangevar_set`.
- `test/hoctests/tests/test_diam3d_pending.py` (new): HOC `diam(x)`, HOC `diam(a:b)` and Python `seg.diam`.

Each test fails on the commit before its fix and passes with it. Full `ctest` locally (Linux, NMODL on, no MPI or InterViews): all new and changed tests pass. Eight unrelated tests fail identically on an unmodified master build on the same machine: `basic_tests` (pytest and coreneuron), `cover_tests`, `test_nonlin_py`, `test_vlag_py`, `test_kschan_py`, `test_random_py` and `external_nrntest`.

The companion C API pull request (`issue3863-capi-diam`) makes `nrn_segment_diam_set` propagate to 3-d points, and it includes the same pre-write recompute there. The two branches merge cleanly in either order.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef8f20d1f578`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.