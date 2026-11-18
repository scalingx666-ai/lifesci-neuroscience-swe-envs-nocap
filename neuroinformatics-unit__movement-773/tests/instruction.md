# Issue

**Title:** Add ROI save/load functionality via GeoJSON

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Users need the ability to save and load regions of interest (ROIs) to/from files for persisting ROI definitions across sessions
and sharing ROIs between collaborators. See issue #675  and [this Zulip topic](https://neuroinformatics.zulipchat.com/#narrow/channel/406001-Movement/topic/Format.20for.20storing.20ROIs.20to.20disk/with/535685395) for context.

**What does this PR do?**

Adds GeoJSON-based serialisation for regions of interest, using shapely's native `to_geojson()` and `from_geojson()` functions.

I went with GeoJSON because it:
- Is a widely used, human-readable JSON format. The [specification](https://geojson.org/) is well-defined as RFC 7946.
- Can store metadata (name, ROI type) in the `properties` field
- Can support both single and multiple ROIs via `Feature` and `FeatureCollection` constructs (here we always use `FeatureCollection` for simplicity, even for lists of 1 ROI)
- Is interoperable with GIS tools and web-friendly (not relevant now, but may be nice in the future)

This PR adds the following new functionality:
- ~Methods on ROI classes: `to_file()`, `from_file()`~
- Module: `movement/roi/io.py`, with functions `save_rois()`, `load_rois()`
- Type alias: `ROICollection`
- A new file validator class: `ValidROICollectionGeoJSON`

**Example usage:**
```python
from movement.roi import LineOfInterest, PolygonOfInterest, save_rois, load_rois

#  Define ROis
arena = PolygonOfInterest([(0, 0), (10, 0), (10, 10), (0, 10)], name="arena")
divider = LineOfInterest([(5, 0), (5, 10)], name="divider")

# Save to file
save_rois([arena, boundary], "experiment_regions.geojson")

# Load from file
rois = load_rois("experiment_regions.geojson")  # Returns [PolygonOfInterest, LineOfInterest]
```

## References

- .
- Part of the broader #617 effort.
- Previous attempt by a contributor: #735 

For context, the overall plan is as follows:
1.  handles the frontent UI for ROI creation and editing in `napari`.
2. This PR adds the backend save/load functionality for ROI objects
3. A PR will follow to integrate the two by solving #676, i.e. handling conversion between `napari` shape representations and `movement` ROI objects. Users should be able to create ROIs in `napari`, save them to disk using this PR's functionality, and load them back into `napari` or in a `movement` analysis script. At this stage, we will add integration tests and docs to cover the full workflow.

## How has this PR been tested?

Added unit tests in `tests/test_unit/test_roi/test_io.py` covering multiple ROI save/load scenarios.
Also, new tests have been added to `tests/test_unit/test_validators/test_files_validators.py`.

## Is this a breaking change?

No. This PR only adds new functionality. Existing code is unaffected.

## Does this PR require an update to the documentation?

- [x] The API docs are automatically generated from docstrings (I have verified that throught a local docs build).
- [x] Added examples in the docstrings of `save_rois()` and `load_rois()`.
- [x] Updated existing sphinx-gallery example about ROIs to showcase the new functionality in a note

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc95dddcf7ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.