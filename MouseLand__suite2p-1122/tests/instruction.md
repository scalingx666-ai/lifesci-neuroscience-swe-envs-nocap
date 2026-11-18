# Issue

**Title:** Bug fix for python 3.11 and over

## Description

Hello, 

It seems like Suite2p fails to import for Python 3.11 and Python 3.12 because of the following error:
```
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/__init__.py", line 6, in <module>
    from .run_s2p import run_s2p, run_plane, pipeline
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/run_s2p.py", line 15, in <module>
    from . import extraction, io, registration, detection, classification, default_ops
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/extraction/__init__.py", line 5, in <module>
    from .extract import create_masks_and_extract, enhanced_mean_image, extract_traces_from_masks, extraction_wrapper
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/extraction/extract.py", line 11, in <module>
    from .masks import create_masks
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/extraction/masks.py", line 9, in <module>
    from ..detection.sparsedetect import extendROI
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/detection/__init__.py", line 4, in <module>
    from .detect import detect, detection_wrapper, bin_movie
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/detection/detect.py", line 9, in <module>
    from . import sourcery, sparsedetect, chan2detect, utils
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/detection/sourcery.py", line 12, in <module>
    from .stats import fitMVGaus
  File "/opt/anaconda3/envs/py311/lib/python3.11/site-packages/suite2p/detection/stats.py", line 52, in <module>
    @dataclass(frozen=True)
     ^^^^^^^^^^^^^^^^^^^^^^
  File "/opt/anaconda3/envs/py311/lib/python3.11/dataclasses.py", line 1211, in wrap
    return _process_class(cls, init, repr, eq, order, unsafe_hash,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/opt/anaconda3/envs/py311/lib/python3.11/dataclasses.py", line 959, in _process_class
    cls_fields.append(_get_field(cls, name, type, kw_only))
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/opt/anaconda3/envs/py311/lib/python3.11/dataclasses.py", line 816, in _get_field
    raise ValueError(f'mutable default {type(f.default)} for field '
ValueError: mutable default <class 'numpy.ndarray'> for field rsort is not allowed: use default_factory
```

I have suggested a small fix to avoid this error during import, by avoiding the ValueError caused by using a mutable default value in your dataclass, where you should use the default_factory argument of the field function. This ensures that each instance of the dataclass gets its own separate instance of the mutable object.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c88e1ba3aa20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.