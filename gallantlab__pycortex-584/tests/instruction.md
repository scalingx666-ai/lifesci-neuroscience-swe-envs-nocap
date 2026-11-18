# Issue

**Title:** Handle NumPy 2.x hash compatibility for WebGL data

## Description

WebGL data hashing failed on NumPy ≥2.2 because `ndarray.tostring()` was removed, causing WebGL view initialization to crash when hashing brain data arrays.

- **Hashing fix**: Coerce inputs to NumPy arrays and hash via `tobytes()` in `braindata._hash` to restore compatibility with modern NumPy.
- **Regression coverage**: Added a focused test in `cortex/tests/test_braindata.py` that asserts `_hash` matches `hashlib.sha1(array.tobytes())` for NumPy arrays.

Example:
```python
import numpy as np
from cortex.dataset.braindata import _hash

arr = np.arange(12, dtype=np.float32).reshape(3, 4)
print(_hash(arr))  # hashes using arr.tobytes()
```

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>numpy.ndarray has no attribute 'tostring' when using webgl</issue_title>
> <issue_description>Hi,
> I encountered this error while attempting to use the WebGL view with **Pycortex v1.2.11 and NumPy 2.3.4**:
> ```
>   File "/home/ftravi/Documents/Projects/fmri-context/decoding/plot_rois.py", line 30, in <module>
>     webgl.show(vol, with_colorbar=True, linewidth=4, thick=1, with_curvature=True, roi_list=ROIS_TO_PLOT, open_browser=True)
>   File "/home/ftravi/.local/lib/python3.12/site-packages/cortex/utils.py", line 40, in __call__
>     return self._load()(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/ftravi/.local/lib/python3.12/site-packages/cortex/webgl/view.py", line 399, in show
>     package = Package(data)
>               ^^^^^^^^^^^^^
>   File "/home/ftravi/.local/lib/python3.12/site-packages/cortex/webgl/data.py", line 24, in __init__
>     self.uniques = list(data.uniques(collapse=True))
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/ftravi/.local/lib/python3.12/site-packages/cortex/dataset/dataset.py", line 120, in uniques
>     uniques.add(sv)
>   File "/home/ftravi/.local/lib/python3.12/site-packages/cortex/dataset/braindata.py", line 63, in __hash__
>     return hash(_hash(self.data))
>                 ^^^^^^^^^^^^^^^^
>   File "/home/ftravi/.local/lib/python3.12/site-packages/cortex/dataset/braindata.py", line 631, in _hash
>     return hashlib.sha1(array.tostring()).hexdigest()
>                         ^^^^^^^^^^^^^^
> AttributeError: 'numpy.ndarray' object has no attribute 'tostring'
> ```
>
> As stated in the traceback, it occurs in line 631 of dataset/braindata.py.
>
> **Minimal code to reproduce the error:**
> - Have Numpy > 2.2 installed
> ```
> import cortex
> vol = cortex.Volume.random(subject='S1', xfmname='fullhead')
> cortex.webshow(vol)
> ```
>
> **Quick fix:**
> Simply replacing line 631 in dataset/braindata.py from:
> `return hashlib.sha1(array.tostring()).hexdigest()`
> to:
> `return hashlib.sha1(array.tobytes()).hexdigest()`
>
> If needed, I can open a pull request with this fix.
>
> Thank you!</issue_description>
>
> <agent_instructions>Make sure to check other places that have .tostring() and ensure compatibility with recent numpy versions.</agent_instructions>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes gallantlab/pycortex#583

<!-- START COPILOT CODING AGENT TIPS -->
---

💬 We'd love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d94db32ecc12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.