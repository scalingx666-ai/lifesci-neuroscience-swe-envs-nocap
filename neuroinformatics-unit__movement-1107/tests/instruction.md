# Issue

**Title:** Widen frame slider range only if movement layers

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
With the version in `main`, a frame slider range update is triggered, for example:
* if someone loads a `Points` layer that has more rows (i.e. elements in the first axis) than there are frames in the previously loaded `movement` data; or
* if a user loaded `movement` data at some point (which wired the viewer), then deleted every `movement` layer, and then added a plain `Points` layer. When adding this layer the frame slider callback still fires, and the span is made to match the row count (i.e. size of first dimension) of that data in that layer. Note that the row count is not necessarily the frame count.

All of this would also happen if the `movement` metawidget is closed (after #1090). Although not the common workflow, and not a wrong behaviour per se, some of these could be surprising for users - especially the issue conflating row count and frame count.

**What does this PR do?**
With the changes in this PR:
* Only `movement` layers are candidate layers to trigger the frame slider update.
   * Before, every non-empty layer contributed a frame span;
   * Now, we deal with `movement` layers and napari deals with non-movement layers.
* The frame slider widens only if required.
    * Before, it always updated the slider to the max `max_frame_idx` of the candidate layers and forced the step to 1.0 (note this update could also narrow the range of the full set of visible data, since e.g. Labels layers were not candidate layers);
    * Now, it takes min/max against what napari computed and keeps napari's step.
 
Note that napari takes care of any non-movement layers that are present and impose a larger frame span.

Specifically, this PR:
- Sets `max_frame_idx` as a movement-metadata key (under `MAX_FRAME_IDX_KEY`) and uses it to identify movement layers that trigger a frame slider update.
- Suggests a more compact and elegant way to trigger a frame slider update.
- In the `sample_layer` fixture, removes the conflation between rows in the data array and frame numbers (for the Points layer data, the Tracks layer data and the Shapes layer data).
- Adds three tests to `test_layer_wiring.py`.

## References

This work came from a  by @niksirbi in PR #1090 

## How has this PR been tested?

Tests pass locally and in CI.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d86923eecd9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.