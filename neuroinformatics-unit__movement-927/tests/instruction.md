# Issue

**Title:** Add conversion between `napari` Shapes and `movement` RoIs

## Description

## Description

### What is this PR

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

### Why is this PR needed?

.

Users can draw Regions of Interest (RoIs) in the `napari` GUI (via #617), but there is no way to convert those shapes to `movement` RoI objects for analysis, or to load previously defined RoIs back into `napari`.

This PR adds the conversion layer that makes both directions possible.

### What does this PR do?

- [x] Adds conversion functions between `napari` shapes and `movement` RoIs (`movement/napari/convert_roi.py`).
- [x] Adds "Save layer" and "Load layer" buttons to the regions widget introduced in #617 and connects them (via the aforementioned conversion functions) to the existing `movement.roi.io` functions that read/write GeoJSON files.
- [x] Updates the "Define Regions of Interest" section of the GUI user guide to explain the new Save/Load functionality.
- [x] Update the `boundary_angles.py` example involving RoIs to refer to drawing regions in `napari` instead of defining them programmatically.
- [x] Adds an integration test that covers the full workflow of drawing some shapes, saving them, loading them in Python, using them in analysis, and then loading them back into the GUI.

A sneak-peek of the "Define regions of interest" widget as it looks with these additions:

<img width="1024" height="496" alt="napari_aeon_regions" src="https://github.com/user-attachments/assets/14066c7e-8f4e-4487-9c89-e0df2e6623cf" />

**Conversion functions (`convert_roi.py`)**

The new module lives under `movement/napari/` rather than `movement/roi/`. It makes sense to keep `napari` an optional dependency that the core RoI module never imports. Better to have the `napari` part of the code import from the core RoI module than the other way around.

The module provides four public functions:

- `roi_to_napari_shape`: single `movement` RoI → `napari` shape (data + shape type)
- `rois_to_napari_shapes`: sequence of RoIs → dict of kwargs ready for `add_shapes`
- `napari_shape_to_roi`: single `napari` shape → `movement` RoI
- `napari_shapes_to_rois`: entire `napari` Shapes layer → list of RoIs

> [!note]
> Question to the NIU reviewer:
> Now that we have `movement/napari/convert_roi.py`, does it make sense to rename the older `movement/napari/convert.py` to `movement/napari/convert_dataset.py` for clarity?

**Known conversion losses**

Also documented in docstrings and user guide, but worth calling out here:

- **Shape type collapsing**: `"line"` and `"path"` both become `LineOfInterest`; `"polygon"`, `"rectangle"`, and `"ellipse"` all become `PolygonOfInterest`. On the way back, `LineOfInterest` becomes `"path"` and `PolygonOfInterest` becomes `"polygon"`. I think this is acceptable because the specific shape type is a GUI drawing concern, not an analytical one. What matters is that the geometry is preserved (true except for the following 2 cases) and users can roundtrip without redefining their RoIs by hand.
- **Ellipse approximation**: Ellipses have no native `shapely` representation and are approximated as polygons (a logged info message is emitted). Introducing a custom `EllipseOfInterest` class would depart from the `shapely`/GeoJSON standard we otherwise follow for RoI geometry, and the polygon approximation is accurate enough for practical analysis purposes.
- **Closed lines**: `LineOfInterest` objects with `loop=True` have no closed-path equivalent in `napari`; the closing segment is dropped and a warning is emitted. Loading them as polygons would be more surprising, since a closed line and a filled polygon have different semantics. This is a niche case anyway, as closed lines can only be created via the Python API, not by drawing in the GUI.

**Save/Load buttons (`regions_widget.py`)**

- The **Save** button writes the current region layer to a GeoJSON file via `napari_shapes_to_rois`, followed by `save_rois`. It is disabled when the layer has no shapes. If duplicate region names are detected, a warning dialog is shown before saving, giving the user the option to cancel and rename first.
- The **Load** button reads a GeoJSON file via `load_rois`, followed by `rois_to_napari_shapes`, and adds its regions as a new layer named after the file stem, which is then selected in the dropdown.
- Both buttons use `napari.utils.notifications.show_error` to surface errors in the napari GUI. This is consistent with `loader_widgets.py` and avoids double-logging, since the underlying I/O functions already log errors at the source. 
- Successful saves and loads are recorded with `logger.info` (also consistent with `loader_widgets.py`), including the number of regions and file path.


### References

This is part of the larger #378 effort, and is the missing link that connects  with  

### How has this PR been tested?

- Unit tests for the four conversion functions are in `tests/test_unit/test_napari_plugin/test_convert_roi.py`, including roundtrip tests in both directions.
- Unit tests for the Save/Load buttons are in `tests/test_unit/test_napari_plugin/test_regions_widget.py`, covering: button tooltips, save-button enable/disable state, handler connections, cancel (no-op when dialog is dismissed), valid load/save, and error paths.
- Integration test in `tests/test_integration/test_napari_roi_workflow.py` covers the full end-to-end workflow: draw a polygon and a path on a RegionsWidget layer, save to GeoJSON via the widget, load the file in Python with `load_rois()` and verify geometry/names, use the loaded RoIs for spatial analysis (`contains_point`), then load the GeoJSON back into napari via the widget and verify geometry is preserved through the full roundtrip.

### How to review this PR?

This is mainly addressed to our collaborators at the [Keshavarzi Lab](https://www.keshavarzilab.com), but all are welcome to review! This is how I recommend you start using the new funcitonality.

#### Quick start: set up a test environment

Clone the repo and check out this branch:

```sh
git clone https://github.com/neuroinformatics-unit/movement.git
cd movement
git fetch origin napari-save-load-regions
git checkout napari-save-load-regions
```

Create a virtual environment (with conda or uv) and install `movement` with GUI and docs dependencies:

**conda:**
```sh
conda create -n movement-review -c conda-forge python=3.13
conda activate movement-review
pip install -e ".[dev,docs]"
```

**uv:**
```sh
uv venv --python=3.13
source .venv/bin/activate    # macOS / Linux
.venv\Scripts\activate       # Windows PowerShell
uv pip install -e ".[dev,docs]"
```

#### Build and browse the docs

```sh
cd docs
make clean html
```

On Windows PowerShell, use `.\make clean html` instead.

Then open `docs/build/html/index.html` in your browser and navigate to **User Guide > Graphical User Interface > Define regions of interest**.

#### Things to try

1. **Follow the updated GUI guide.** Launch the GUI with `movement launch`, draw some regions, save them to a GeoJSON file, close and reopen the GUI, and load them back.
2. **Use saved regions in Python.** Follow the instructions in the **Using saved regions in Python** dropdown (also found in the guide) to load your saved GeoJSON file with `load_rois` and use the loaded regions in your Python code.
3. **Check the updated example.** Navigate to **Examples > Compute distances and angles to regions of interest** in the built docs. This should serve as inspiration for how to use the drawn regions in Python analysis (in this case for spatial navigation applications).

### Is this a breaking change?

No.

### Does this PR require an update to the documentation?

- [x] API docs for the new conversion functions have been auto-generated and inspected.
- [x] The corresponding section of the [GUI user guide](https://movement.neuroinformatics.dev/dev/user_guide/gui.html#define-regions-of-interest) has been updated.
- [x] Gallery example involving RoIs has been updated.

### Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70b199c44871`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.