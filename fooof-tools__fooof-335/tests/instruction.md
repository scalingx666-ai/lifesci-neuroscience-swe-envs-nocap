# Issue

**Title:** Fixed matplotlib is required

## Description

`matplotlib` is an optional dependency, but it is a required dependency as follows.

```
$  python -c "import specparam"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "*/python3.12/site-packages/specparam/__init__.py", line 6, in <module>
    from .objs import SpectralModel, SpectralGroupModel, SpectralTimeModel, SpectralTimeEventModel
  File "*/python3.12/site-packages/specparam/objs/__init__.py", line 3, in <module>
    from .model import SpectralModel
  File "*/python3.12/site-packages/specparam/objs/model.py", line 10, in <module>
    from specparam.objs.base import BaseObject
  File "*/python3.12/site-packages/specparam/objs/base.py", line 14, in <module>
    from specparam.objs.results import BaseResults, BaseResults2D, BaseResults2DT, BaseResults3D
  File "*/python3.12/site-packages/specparam/objs/results.py", line 14, in <module>
    from specparam.data.conversions import group_to_dict, event_group_to_dict
  File "*/python3.12/site-packages/specparam/data/conversions.py", line 9, in <module>
    from specparam.analysis.periodic import get_band_peak_arr
  File "*/python3.12/site-packages/specparam/analysis/__init__.py", line 3, in <module>
    from .error import compute_pointwise_error, compute_pointwise_error_group
  File "*/python3.12/site-packages/specparam/analysis/error.py", line 6, in <module>
    from specparam.plts.error import plot_spectral_error
  File "*/python3.12/site-packages/specparam/plts/__init__.py", line 3, in <module>
    from .spectra import plot_spectra, plot_spectrogram
  File "*/python3.12/site-packages/specparam/plts/spectra.py", line 14, in <module>
    from specparam.plts.templates import plot_yshade
  File "*/python3.12/site-packages/specparam/plts/templates.py", line 15, in <module>
    from specparam.plts.utils import check_ax, set_alpha
  File "*/python3.12/site-packages/specparam/plts/utils.py", line 18, in <module>
    from specparam.plts.settings import PLT_ALPHA_LEVELS, PLT_ALIASES
  File "*/python3.12/site-packages/specparam/plts/settings.py", line 5, in <module>
    import matplotlib.pyplot as plt
ModuleNotFoundError: No module named 'matplotlib'
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f48b8499b9f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.