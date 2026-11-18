# Issue

**Title:** Fix `NWBData` shadowing the data attribute it inherits from `Data`

## Description

## Motivation

I found this while  to apply to `GrayscaleImage` datasets, and discovering that it silently did nothing. `NWBData` re-declares `self.__data` in its `__init__` and overrides the `data` property to read it, which shadows the storage it inherits from `hdmf.container.Data`. The inherited `set_data_io` writes the parent's attribute while `.data` reads the child's, so the `DataIO` wrapping is applied and then never seen again, and the dataset is written uncompressed with nothing warning you. This affects every `NWBData` subclass, so `ScratchData`, `ImageReferences`, `ExternalImage` and the image types, and the same shadow leaves `transform`, `append`, and `extend` operating on a different attribute than the parent thinks it is holding.

The fix is to let the parent own the storage. The private attribute and the `data` property go, `__len__` was a duplicate of hdmf's so it goes with them, and `append` and `extend` become a type guard that delegates to `super()`, which keeps the existing error message for scalar data.

Two behavior changes worth a reviewer's attention. `Data.__init__` runs `coerce_pandas_data` before storing while `NWBData` stashed the raw argument, so `.data` now returns the coerced value, meaning a `pandas.Series` passed as `data` reads back as the `ndarray` that was always the thing actually written to the file. And because `append` and `extend` now go through hdmf's `append_data` and `extend_data`, appending an array to ndarray-backed data concatenates instead of raising `ValueError: all the input arrays must have same number of dimensions`. That is the reproduction in #727, which this improves but does not close, since the list and ndarray cases still diverge. The existing test suite passes without modification.

## How to test the behavior?

```python
import numpy as np
from hdmf.backends.hdf5 import H5DataIO
from pynwb.image import GrayscaleImage

image = GrayscaleImage(name="image", data=np.zeros((4, 4)))
image.set_data_io(H5DataIO, dict(compression="gzip"))

# before: <class 'numpy.ndarray'>, the H5DataIO is stranded on the parent attribute
# after:  <class 'hdmf.backends.hdf5.h5_utils.H5DataIO'>
print(type(image.data))
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5942a7f54d12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.