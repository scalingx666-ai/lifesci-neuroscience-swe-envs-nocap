# Issue

**Title:** Only write ImageSeries.num_samples when it was explicitly provided

## Description

## Motivation

Fix #2227.

`ImageSeries.num_samples` is a property that falls back to the inherited `TimeSeries.num_samples`, i.e. `len(data)`, when the user did not supply a value. There is no custom mapping for that dataset, so the default `ObjectMapper` read the property and persisted the derived value. Every `ImageSeries` (and `OpticalSeries`, `OnePhotonSeries`, `TwoPhotonSeries`) built from internal data therefore wrote a `num_samples` dataset the user never set, and because the derived value is a Python `int` and the schema dataset is `uint32`, HDMF widened it to `uint64` and emitted `DtypeConversionWarning: Spec 'ImageSeries/num_samples': Value with data type int64 is being converted to data type uint64 (min specification: uint32)`. That warning fires across the image and ophys integration tests today.

The schema documents `num_samples` as the frame count that cannot otherwise be recovered, which is the `format='external'` plus `starting_time`/`rate` case, so writing a value derived from `len(data)` is redundant. This matches the conclusion in #2215 that persisting it for internal data was an oversight.

## Fix

`ImageSeriesMap` now maps the write path of the `num_samples` spec to the private `_num_samples`, which holds a value only when `num_samples` was explicitly passed to the constructor. When it was not set, nothing is written. The read path is untouched, so a file that does contain `num_samples` still maps it back to the `num_samples` constructor argument and round-trips unchanged. The in-memory `ImageSeries.num_samples` property is also unchanged and still returns the frame count derived from the data.

An `object_attr` override additionally casts an explicitly provided, in-range value to `uint32` so it is written with the schema dtype rather than being widened to `uint64`. Out-of-range values are passed through untouched so HDMF still reports the mismatch.

## How to test the behavior?

```python
import numpy as np, warnings, h5py
from datetime import datetime
from dateutil.tz import tzlocal
from pynwb import NWBFile, NWBHDF5IO
from pynwb.image import ImageSeries

nwbfile = NWBFile("s", "i", datetime.now(tzlocal()))
nwbfile.add_acquisition(ImageSeries(name="img", data=np.zeros((10, 5, 5), dtype=np.uint8), unit="n.a.", rate=1.0))
with warnings.catch_warnings(record=True) as w:
    warnings.simplefilter("always")
    with NWBHDF5IO("test.nwb", "w") as io:
        io.write(nwbfile)
print([str(x.message) for x in w])   # before: one DtypeConversionWarning, after: []
with h5py.File("test.nwb") as f:
    print(list(f["acquisition/img"].keys()))   # before: [..., 'num_samples', ...], after: no num_samples
```

Four new tests in `tests/integration/hdf5/test_image.py` cover this. They fail on `dev` and pass with the change:

```
FAILED tests/integration/hdf5/test_image.py::TestImageSeriesWithNumSamplesIO::test_num_samples_written_as_uint32
FAILED tests/integration/hdf5/test_image.py::TestImageSeriesDerivedNumSamplesIO::test_derived_num_samples_not_written
FAILED tests/integration/hdf5/test_image.py::TestImageSeriesNumSamplesWriteWarnings::test_no_warning_for_derived_num_samples
FAILED tests/integration/hdf5/test_image.py::TestImageSeriesNumSamplesWriteWarnings::test_no_warning_for_explicit_num_samples
4 failed, 4 passed, 9 deselected
```

After the change, `pytest tests/integration/hdf5/test_image.py tests/integration/hdf5/test_ophys.py` passes with zero `num_samples` dtype-conversion warnings, down from the previous count.

I deliberately left out the consistency check you suggested in #2215, where an explicitly provided `num_samples` on an internal `ImageSeries` should be validated against the number of frames in the data. Happy to add it here or in a follow-up if you would like it.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f378275375b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.