# Issue

**Title:** Add Python copy protocol support to BSVTKObjectWrapper

## Description

BSVTKObjectWrapper didn't support Python's standard `copy()` method, causing `AttributeError` when downstream libraries (e.g., brainstat) attempted to copy wrapped VTK objects. VTK uses `ShallowCopy()` and `DeepCopy()` instead of implementing Python's copy protocol.

## Changes

- **Add `copy(deep=False)` method to BSVTKObjectWrapper**
  - Uses VTK's `NewInstance()` to create new object of same type
  - Delegates to VTK's `ShallowCopy()` or `DeepCopy()` based on `deep` parameter
  - Returns result wrapped in appropriate subclass via `BSWrapVTKObject()`

- **Implement Python copy protocol**
  - `__copy__()` for `copy.copy()` support
  - `__deepcopy__(memo)` for `copy.deepcopy()` with memo tracking for circular references

## Usage

```python
import copy
from brainspace.vtk_interface import wrap_vtk
import vtk

surface = wrap_vtk(vtk.vtkPolyData())
# ... populate surface ...

# All of these now work:
surface_copy = surface.copy()           # Shallow copy
surface_copy = copy.copy(surface)       # Python copy module
surface_deep = copy.deepcopy(surface)   # Deep copy with memo tracking
```

Shallow copies share data arrays; deep copies are independent. Wrapper type is preserved (e.g., `BSPolyData` → `BSPolyData`).

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>AttributeError: 'PolyData' object has no attribute 'copy' with python 3.10 in venv</issue_title>
> <issue_description>when running the tutorial with this code, I get this error even though everything is installed on Python 3.10.
> from the turitoal
> import copy
>
> import matplotlib.pyplot as plt
> import numpy as np
> import pandas as pd
> from brainspace.utils.parcellation import reduce_by_labels
> from matplotlib.cm import get_cmap
>
> from brainstat.context.genetics import surface_genetic_expression
> from brainstat.datasets import fetch_parcellation
>
> # Get Schaefer-100 genetic expression.
> schaefer_100_fs5 = fetch_parcellation("fsaverage5", "schaefer", 100)
> surfaces = fetch_template_surface("fsaverage5", join=False)
> expression = surface_genetic_expression(schaefer_100_fs5, surfaces, space="fsaverage")
>
> # Plot Schaefer-100 genetic expression matrix.
> colormap = copy.copy(get_cmap())
> colormap.set_bad(color="black")
> plt.imshow(expression, aspect="auto", cmap=colormap)
> plt.colorbar().ax.tick_params(labelsize=14)
> plt.xticks(fontsize=14, rotation=45)
> plt.yticks(fontsize=14)
> plt.xlabel("Gene Index", fontdict={"fontsize": 16})
> plt.ylabel("Schaefer 100 Regions", fontdict={"fontsize": 16})
> plt.gcf().subplots_adjust(bottom=0.2)
>
>
>
> --------------------------------------------------------------------------
> AttributeError                            Traceback (most recent call last)
> File ~/py310/lib64/python3.10/site-packages/brainspace/vtk_interface/wrappers/base.py:212, in BSVTKObjectWrapper.__getattr__(self, name)
>     211 try:
> --> 212     attr = super().__getattr__(name)
>     213     if callable(attr):
>
> File ~/py310/lib64/python3.10/site-packages/vtkmodules/numpy_interface/dataset_adapter.py:128, in VTKObjectWrapper.__getattr__(self, name)
>     127 "Forwards unknown attribute requests to VTK object."
> --> 128 return getattr(self.VTKObject, name)
>
> AttributeError: 'PolyData' object has no attribute 'copy'
>
> During handling of the above exception, another exception occurred:
>
> KeyError                                  Traceback (most recent call last)
> Cell In[3], line 15
>      13 schaefer_100_fs5 = fetch_parcellation("fsaverage5", "schaefer", 100)
>      14 surfaces = fetch_template_surface("fsaverage5", join=False)
> ---> 15 expression = surface_genetic_expression(schaefer_100_fs5, surfaces, space="fsaverage")
>      17 # Plot Schaefer-100 genetic expression matrix.
>      18 colormap = copy.copy(get_cmap())
>
> File ~/py310/lib64/python3.10/site-packages/brainstat/context/genetics.py:173, in surface_genetic_expression(labels, surfaces, space, atlas_info, ibf_threshold, probe_selection, donor_probes, lr_mirror, missing, tolerance, sample_norm, gene_norm, norm_matched, norm_structures, region_agg, agg_metric, corrected_mni, reannotated, return_counts, return_donors, return_report, donors, data_dir, verbose, n_proc)
>     169 if not isinstance(surface, str) and not isinstance(surface, Path):
>     170     # Cast surface data to float32 to comply with GIFTI standard
>     171     # GIFTI only supports uint8, int32, and float32 datatypes
>     172     if hasattr(surface, 'Points') and surface.Points.dtype != np.float32:
> --> 173         surface = surface.copy()
>     174         surface.Points = surface.Points.astype(np.float32)
>     176     f = tempfile.NamedTemporaryFile(suffix=".gii", delete=False)
>
> File ~/py310/lib64/python3.10/site-packages/brainspace/vtk_interface/wrappers/base.py:217, in BSVTKObjectWrapper.__getattr__(self, name)
>     215     return _wrap_output_data(attr)
>     216 except:
> --> 217     return _wrap_output_data(self._handle_call('get', name, None))
>
> File ~/py310/lib64/python3.10/site-packages/brainspace/vtk_interface/wrappers/base.py:180, in BSVTKObjectWrapper._handle_call(self, key, name, args)
>     177     except:
>     178         pass
> --> 180 method = self.vtk_map[key][name.lower()]
>     182 if isinstance(method, dict):
>     183     if isinstance(args, str) and args.lower() in method['options']:
>
> KeyError: 'copy'</issue_description>
>
> <agent_instructions>fix this issue</agent_instructions>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes MICA-MNI/BrainSpace#138

<!-- START COPILOT CODING AGENT TIPS -->
---

💬 We'd love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fb64138ff34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.