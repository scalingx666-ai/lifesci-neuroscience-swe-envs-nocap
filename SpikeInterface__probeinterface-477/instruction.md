# Issue

**Title:** Do not convert a probe's annotations to lists in Probe.to_dict

## Description

`Probe.to_dict(array_as_list=True)` converts the probe's own `contact_annotations` arrays to lists in place, not just in the dict it returns. `write_probeinterface` calls it, so saving a probe to JSON changes the probe in memory, and later calls on that probe can fail:

```python
import numpy as np
from probeinterface import generate_linear_probe, write_probeinterface
p = generate_linear_probe(num_elec=4)
p.annotate_contacts(quality=np.array([1.0, 2.0, 3.0, 4.0]))
write_probeinterface("p.json", p)
print(type(p.contact_annotations["quality"]))
p.get_slice(np.array([True, False, True, False]))
```

Observed:

```
<class 'list'>
TypeError: only integer scalar arrays can be converted to a scalar index
```

Expected: `<class 'numpy.ndarray'>`, and the slice works.

Cause: for dict attributes, the loop assigns `v[kk] = vv.tolist()`, and `v` is the probe's own `contact_annotations` (or `annotations`) dict.

Fix: build a new dict for the output and leave the probe's dicts alone. Adds a test that the probe keeps numpy arrays after `to_dict(array_as_list=True)` and can still be sliced.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46e06caaad65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.