# Issue

**Title:** UnitSelectionSorting improvements: remove lexsort, fix bug, save memory by sharing parent cache when possible

## Description

Follows #4606, #4581, #4618, #4695. Just copying my commit messages here:

## Commit 1

Per #4606  and #4618, full lexsort is no longer needed (it is ordered
`going into remap_unit_indices_in_vector`, and that function can't mess up
the ordering).

This also fixes a bug where `SortingAnalyzer.select_units` with
reordered units was incorrectly lexsorting the new sorting's spike
vector, permuting cotemporal spikes into unit-ascending order, while
extensions sliced its per-spike data (e.g. amplitudes, locations, etc.)
with a mask over the old (i.e. unpermuted) spike vector, causing a
discrepancy in ordering where row i of the extension data didn't match
row i of the new (permuted) spike vector.

There were warnings about this already in the code:
```
# TODO check that unit_ids are in same order otherwise many extension do handle it properly!!!!
```
(although to be clear, the cause of the problem here wasn't on the
extension side, but on the Sorting side).

`test_selection_preserves_parent_order`and
`test_select_units_reordered_keeps_extension_alignment` (sorry for this
name, open to suggestions) should hopefully prevent this from happening
again.

## Commit 2

`UnitSelectionSorting` shares the parent's spike vector cache(s) on
identity selections (including rename).

Can save many GBs of memory. This also keeps a lazy Zarr spike vector
lazy (#4623 ).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2750986478b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.