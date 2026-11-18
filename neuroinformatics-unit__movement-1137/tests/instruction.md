# Issue

**Title:** Add frame and full pose reset controls

## Description

## Summary

Related to #1006.

Adds Reset current frame and Reset all frames controls for dragged and deleted pose points. Each loaded pose layer keeps a separate baseline of its positions, properties and marker symbols. Reset restores Points and Tracks together and refreshes the edit timeline.

This implementation uses the file as loaded as the baseline. Edits saved before loading remain intact. That is the policy question in my issue comment, and still needs maintainer confirmation.

The change includes documentation and tests for frame isolation, deleted rows, repeated reset, saved edit flags, marker styling, button availability, timeline updates and an export round trip with missing positions. Bounding boxes, identity swaps and a chronological undo stack are outside this change.

## Validation

The original seven cases use ViewerModel and Qt widgets without an OpenGL canvas. An additional integration case exercises both reset controls through MovementMetaWidget with a real napari viewer and docked timeline.

Repository hooks pass, including Ruff, formatting, mypy, check manifest and codespell.

The earlier OpenGL crash was specific to the offscreen Qt platform. Native macOS Qt works. The full napari plugin suite passes locally on commit `0367d71`: **360 passed, 97 warnings** in 204.61 seconds.

```bash
QT_QPA_PLATFORM=cocoa python -m pytest -q --no-cov tests/test_unit/test_napari_plugin
```

This includes the new docked widget integration case. These are automated GUI checks, not a manual visual inspection. No full repository suite or coverage result is claimed.

## Remaining considerations

The baseline adds memory proportional to the loaded pose data and properties. This version copies them at load time rather than rereading a potentially changed file from disk.

Deleting every point reaches an empty Tracks array error before reset is called. I reproduced this directly in napari 0.9.2 without importing movement: create `Tracks(np.array([[0, 0, 1, 2], [0, 1, 3, 4]], dtype=float))`, then assign `np.empty((0, 4))` to its data. This raises `IndexError` in `_fast_points_lookup`. The regression tests cover deleted points and completely deleted frames while another frame remains. Restoring a fully empty layer remains unresolved; this PR does not patch napari internals.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e316b969446`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.