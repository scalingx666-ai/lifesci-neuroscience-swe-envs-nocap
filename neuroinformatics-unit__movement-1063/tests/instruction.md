# Issue

**Title:** Add napari timeline widget to flag edited points

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [X] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

As reported in issue #1059, when manually correcting pose tracks in the napari plugin, edited points are currently only distinguishable one frame at a time (a dragged point gets a "ring" symbol instead of a "disc"). But once you move to a different frame, there is no way to distinguish edited frames from others. This makes it hard to review or double-check the applied edits. 

**What does this PR do?**

Adds `EditWidget` (`movement/napari/edit_widget.py`), a `matplotlib`-based dock widget inspired by the following [code](https://gist.github.com/jni/a0ae9793a0ca43868dd7dce7ea21df79) and [example](https://xcancel.com/jnuneziglesias/status/1286599143008346112). 

The timeline is docked full-width at the bottom of the napari viewer. It draws one blue bar per edited frame (#006ab3, matching napari's own accent colour), plus a dashed playhead line that tracks the current frame and is always drawn on top. Both point drags and removals are flagged, and edits made in a previous session (saved as NaN rows) are reconstructed on load. The plot follows napari's active theme and updates live when the user switches between light and dark. On the timeline itself, scrolling zooms in and out around the cursor, dragging pans, and double-clicking empty space resets the view to the full frame range; clicking a bar jumps the viewer straight to that edited frame.

The widget is wired into `MovementMetaWidget` through a new collapsible "Edit tracked data" section that acts as a switch: expanding it docks the timeline at the bottom, and collapsing it hides it again. That section auto-expands whenever a point is edited, or when a dataset that already contains edits is loaded, so the edits are visible without an extra click. Expanding it also auto-selects a movement Points layer so the timeline has something to display. The Tracks layer stays a Points layer, and selecting a non-movement layer leaves the timeline unchanged rather than blanking it. Finally, a "Display individuals" checkbox (enabled only for multi-individual datasets) controls how edits are laid out: when off, all edits share a single lane in the one blue colour; when on, they are split into one row per individual, separated by thin horizontal dividers, with individual names on the y-axis and bars coloured per individual using the same colormap (`DEFAULT_COLORMAP`) as the Points/Tracks layers.

Here's a short visual representation of the implementation described. 

https://github.com/user-attachments/assets/9881f186-a901-47f9-8d88-87bdc2616e79


## References

This PR is part of #993  and directly addressed #1059. 

This PR is also related to #996. 

## How has this PR been tested?

This was tested locally. Unit tests were added/updated to cover the new functionality.

## Is this a breaking change?

It changes the UI look. But the main functionality is not changed. 

## Does this PR require an update to the documentation?

Yes, documentation will be written to explain users how to use this edit bar. 

## Checklist:

- [X] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Discussion

1. **Should the edit timeline open automatically for a previously edited dataset?** 

Right now, loading a dataset that already contains edits expands the "Edit tracked data" section: `_on_layer_inserted` checks the layer's edited property and calls `self._edit_collapsible.expand()`, which auto-selects the Points layer and docks the `EditWidget` timeline at the bottom.

I'm not sure this is the behavior we want. A user reopening a dataset doesn't necessarily want to review the edits, so it might be less intrusive to always load with the section collapsed and let them open it themselves. Any thoughts on which default is better?

2. **How should we handle multiple Points layers, and the Tracks layer?**

When several datasets are loaded at once, switching between Points layers updates the timeline correctly. But the Tracks layer isn't linked to its originating Points layer, so selecting it leaves the timeline showing the previously selected Points layer's edits. Is there a clean way to associate a Tracks layer with its corresponding Points layer so the timeline follows either one?

3. **Colouring the bars**

Bars are blue by default, and switch to per-individual colours when "Display individuals" is enabled. I also tried colouring by keypoint, but the bars end up overlapping and it doesn't read well. A radio button toggle didn't help. The alternative would be one row per keypoint (as we do for individuals), but I'm not convinced that scales nicely either, specially for multi-animal datasets. So I've left keypoint colouring out for now. Suggestions welcome. 

4. **Long individual names on the y-axis** 

I think the y-axis margin issue is fixed: previously, long individual names were clipped. Rather than `subplots_adjust`, I kept `tight_layout` but re-call it after a dataset is loaded so the layout adapts to the actual label lengths. I've only tested this with two datasets. It would be worth double-checking with longer individual names to confirm it holds up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41f32842d4d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.