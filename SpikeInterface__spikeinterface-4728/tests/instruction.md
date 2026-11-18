# Issue

**Title:** Handle empty annulus in local common reference

## Description

Building a `common_reference` recording with `reference="local"` raises `ZeroDivisionError: division by zero` whenever a channel has no other channel beyond the exclude (inner) radius. A tetrode reproduces it with the default `local_radius=(30, 55)`, since all four contacts sit within 30 um of each other:

```python
rec = generate_recording(num_channels=4, durations=[1.0], set_probe=False)
rec.set_dummy_probe_from_locations(np.array([[0., 0.], [0., 20.], [20., 0.], [20., 20.]]))
common_reference(rec, reference="local", local_radius=(30., 55.))  # ZeroDivisionError
```

The root cause is in the kernel construction. When the annulus holds fewer than `min_local_neighbors` channels, the code falls back to the closest channels beyond the inner radius, then unconditionally does `local_kernel[i, neighbors_i] = 1 / len(neighbors_i)`. That fallback normally finds something, but if nothing lies beyond the inner radius at all then `neighbors_i` is empty and the division blows up. The user only sees a bare `ZeroDivisionError` with no indication that the radius is the problem.

The fix follows what @alejoe91 suggested in the issue. Channels with no available neighbor keep their kernel row at zero, which leaves them unreferenced, and a warning naming those channels is raised at init. The average operator already computes a zero shift from a zero kernel row, so only the median branch needed a guard: an empty neighborhood there would have produced `nan` from `np.median` of an empty slice, so it now passes the trace through unchanged.

Tested with four new cases in `test_common_reference.py`, parametrized over both operators. The first covers the tetrode geometry where every channel is unreferenced, the second a cross layout where only the center channel has nothing beyond the radius while the four arms are still referenced to their opposite arm. All four fail on main (two with `ZeroDivisionError` at construction, two with `DID NOT WARN`) and pass with the fix. The full `test_common_reference.py` file passes, 11 passed and 1 skipped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbe2e7539ab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.