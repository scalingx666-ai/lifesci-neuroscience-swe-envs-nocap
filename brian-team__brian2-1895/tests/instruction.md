# Issue

**Title:** Preserve units when concatenating quantity arrays

## Description

The exported `concatenate` currently drops dimensions from quantity arrays. Combining two valid spike-time segments therefore produces a dimensionless array that `SpikeGeneratorGroup` rejects:

```python
from brian2 import *
times = concatenate([array([1, 2])*ms, array([3])*ms])
SpikeGeneratorGroup(1, [0, 0, 0], times)
```

Add a unit-aware wrapper for the concatenate case discussed in #872. Inputs must have matching dimensions, with the existing allowance for unitless zeros. Check output dimensions before writing, preserve output-buffer identity, and forward NumPy axis/dtype/casting behavior. Dimensionless and string arrays retain NumPy behavior. The units documentation lists the wrapper.

Validation on Linux/Python 3.13: the units suite, 56 doctests, 452 independent tests (two optional skips), and project hooks pass. In a separate recorded EEG-derived stimulus demonstration, all twelve previously rejected protocols now simulate on NumPy/Cython/C++ standalone and match direct spike-time/event-count references exactly; twelve manual/output-buffer controls remain exact. This establishes protocol construction and simulation behavior, with no clinical inference. The Cython demonstration uses stored synaptic weights to avoid an unrelated existing `i` compiler-name collision. Strict HTML builds on baseline and this branch both report the same 47 diagnostics; the changed pages render, but the full documentation build is not clean. Other platforms, OpenMP and the complete project suite were not run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f803d0c8190`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.