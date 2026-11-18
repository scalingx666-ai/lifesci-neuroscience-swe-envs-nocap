# Issue

**Title:** Add VTK-free HTML surface reports and threemica bridge

## Description

## Video preview

<video src="https://raw.githubusercontent.com/MICA-MNI/BrainSpace/2636d2e30d64ea7499f939096f74a32c13b314b8/docs/_static/brainspace_threemica_bridge_preview.mp4" controls width="900"></video>

[Watch/download the MP4 preview](https://raw.githubusercontent.com/MICA-MNI/BrainSpace/2636d2e30d64ea7499f939096f74a32c13b314b8/docs/_static/brainspace_threemica_bridge_preview.mp4)

The video is committed in this PR at `docs/_static/brainspace_threemica_bridge_preview.mp4` and is referenced from `README.rst`. It was generated with `write_brainspace_threemica_report(...)` from BrainSpace bundled Conte69/fsLR-32k reference surfaces and maps.

## Summary

This PR adds a display-independent HTML reporting path for BrainSpace surface
maps. The existing VTK plotting backend remains the default, while users in
remote notebooks, containers, CI runners, and headless servers can now export
portable browser reports without initializing a VTK render window.

It also adds an optional adapter for Zhengchen Cai's `threemica` package.
BrainSpace prepares compatible surface/map inputs and delegates report
generation to threemica, preserving threemica's original HTML template,
JavaScript viewer, controls, atlas/query payloads, and output layout.

## Reviewer highlights

Video preview added to the README:

- `docs/_static/brainspace_threemica_bridge_preview.mp4`
- The video was generated through the new BrainSpace-to-threemica bridge using
  BrainSpace's bundled Conte69/fsLR-32k reference surfaces and maps.
- It shows the original threemica viewer loading BrainSpace maps, switching
  between cortical thickness, functional connectivity gradient 1, and MPC
  gradient 1.

Main bridge function used in the README:

```python
from brainspace.plotting import write_brainspace_threemica_report

reports = write_brainspace_threemica_report(
    "brainspace_threemica_report",
    maps=["thickness", "fc_gradient1"],
    custom_maps={
        "aligned_gradient": {
            "values": aligned_gradients,
            "label": "Aligned gradient",
            "unit": "score",
            "cmap": "diverging",
        },
    },
)
```

Implementation entry point:

- `brainspace/plotting/threemica_report.py`
- `write_brainspace_threemica_report(...)`
- The function writes BrainSpace surfaces/maps into a temporary BIDS-style
  derivative tree and then delegates rendering to `threemica.run`.

## Changes

- Added `brainspace.plotting.write_surface_report` for self-contained HTML
  reports from left/right surfaces and one or more scalar maps.
- Added `plot_hemispheres(..., backend="html", filename=...)` as a small
  compatibility path for existing plotting code that wants HTML export.
- Added `brainspace.plotting.write_threemica_report` as a thin optional
  dependency adapter around `threemica.run`.
- Added `brainspace.plotting.write_brainspace_threemica_report` to export
  BrainSpace bundled Conte69 fsLR-32k maps through the original threemica
  viewer.
- Added `brainspace.plotting.available_threemica_surface_maps` to expose the
  built-in map tags and metadata.
- Added support for grouped map selections:
  - `maps="all"`
  - `maps="markers"`
  - `maps="gradients"`
  - explicit map tag lists
  - `custom_maps` arrays, including multi-component arrays exported
    column-wise
- Added documentation for HTML surface reports, threemica integration, and
  headless plotting guidance.
- Added a README video preview generated from BrainSpace's bundled
  Conte69/fsLR-32k reference maps through the new threemica bridge.
- Updated the default temporary threemica subject label to
  `sub-brainspaceref` so the generated preview path is not mistaken for
  participant data.
- Added a small Sphinx compatibility shim so the existing `sphinx-tabs`
  extension can build with newer Sphinx versions that renamed
  `add_javascript` to `add_js_file`.
- Added tests for report serialization, `plot_hemispheres` HTML export,
  threemica delegation, built-in/custom map selection, and import hygiene.

## Notes

- `threemica` is not vendored into BrainSpace. It remains an optional external
  dependency.
- The VTK backend remains the default behavior for `plot_hemispheres` and
  existing plotting workflows.
- Importing the new HTML/threemica report helpers does not import `vtk` or
  `brainspace.plotting.base`.
- The README preview asset does not include private or participant data; it is
  generated from BrainSpace package data.

## Verification

```bash
python -m pytest brainspace/tests/test_surface_report.py brainspace/tests/test_threemica_report.py -q
```

Result:

```text
10 passed
```

Fresh-process import hygiene:

```bash
python - <<'PY'
import sys
from brainspace.plotting import (
    available_threemica_surface_maps,
    write_brainspace_threemica_report,
    write_threemica_report,
)
print('vtk_loaded', 'vtk' in sys.modules)
print('render_base_loaded', 'brainspace.plotting.base' in sys.modules)
PY
```

Result:

```text
vtk_loaded False
render_base_loaded False
```

Browser verification:

- Generated an all-map threemica report from bundled BrainSpace Conte69/fsLR-32k
  maps with the current bridge code.
- Opened the report through a local HTTP server.
- Confirmed the original threemica viewer loaded on the Cortical Curvature
  report page with no console errors.
- Confirmed all seven map entries were present:
  - Cortical Curvature
  - Cortical Thickness
  - T1w/T2w Myelin Proxy
  - Functional Connectivity Gradient 1
  - Functional Connectivity Gradient 2
  - MPC Gradient 1
  - MPC Gradient 2

README/video verification:

```bash
python - <<'PY'
from pathlib import Path
from docutils.core import publish_doctree

publish_doctree(Path('README.rst').read_text())
print('README.rst parsed')
PY

ffprobe -v error -select_streams v:0 \
  -show_entries stream=codec_name,width,height,nb_frames,duration \
  -of default=noprint_wrappers=1 \
  docs/_static/brainspace_threemica_bridge_preview.mp4

python -m sphinx -b html docs /tmp/brainspace-docs-smoke \
  -D sphinx_gallery_conf.plot_gallery=False
```

Result:

```text
README.rst parsed
codec_name=h264
width=960
height=540
duration=8.000000
nb_frames=192
Sphinx-Gallery gallery_conf["plot_gallery"] was False, so no examples were executed.
build succeeded, 30 warnings.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8730de88ae32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.