# Issue

**Title:** Fix lifetime of napari layer callbacks

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
All layer callbacks are silently garbage-collected (and stop acting) if the `movement` meta-widget is closed. 

This has relevant consequences for layer callbacks that write to layer data and layer properties that outlive the widget and get saved to disk (i.e. the `DataLoader` layer callbacks). 

For example, once the movement meta-widget is garbage-collected:
* Point edits no longer reach the tracks layer. The track segment still ends at the point's old position.
* Edited points stop being marked as edited and their confidence is no longer set to NaN
* A point deletion doesn't remove the corresponding tracks row, so every subsequent track row is offset by one. 
* In the default view a point drag can only change x/y, but if you roll the axes or switch to 3D in the viewer, frame becomes draggable too. We have a callback to disable editing in these cases, but closing the meta-widget would eventually remove the callback. Plus if editing was disabled when the meta widget closed, restoring the 2D view won't re-enable it.
* The frame slider stops adjusting its range when layers are added or removed, so it may not span all frames.

<details>
<summary>A sample user sequence that would trigger this:</summary>

1. Load via the panel.
3. Close the panel (e.g. for canvas space) .
4. Edit points. At first they still sync (e.g. the symbol changes to ring), because the orphaned `DataLoader` is not garbage collected yet, but at an unpredictable time they will stop being marked as 'edited'.


Suppose you have been editing and reopen the movement meta-widget to save the changes. This triggers the gc, the old `DataLoader` is collected and its connections go dead. The new `DataLoader` does not adopt the existing layers, because `events.data` is connected only in `_add_points_layer`. Any further edits are not synced and the data would be saved in an inconsistent state.
</details>

**What does this PR do?**

All the layer callbacks above are **bound methods of the `DataLoader` widget**, and napari prunes them silently once the widget dies. This can be fixed if we change what owns the callbacks, while keeping their functionality intact.

More specifically: napari's `EventEmitter._normalize_cb` treats any *non-method* callable as a strong reference. So a module-level function connected to a layer's emitter lives as long as that layer.

This PR adds:
* A new file, `movement/napari/layer_wiring.py`, holding the layer-syncing code that used to sit in the loader widget.
* New tests that recreate the situation deliberately: load a dataset, throw the panel away, force Python to clean it up, then edit and delete points and roll the view. 
* The existing plugin tests are unchanged in what they check; a few now call the moved code directly instead of going through the panel. 

The write-up of the problem and the proposed fix, `proposal-layers-unsynced.md`, is committed first [here](https://github.com/neuroinformatics-unit/movement/blob/b6d5502d129a2bbb27baae0cb12be6501fcf7b68/proposal-layers-unsynced.md) so the reasoning is on record. Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>.


## References

\

## How has this PR been tested?

Tests pass locally and in CI

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ \ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c2acb186b1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.