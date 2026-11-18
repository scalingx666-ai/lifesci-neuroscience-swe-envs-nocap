# Issue

**Title:** Updated zscore for in-place operations

## Description

The `zscore` function has a parameter `inplace`, to allow storing the z-scored values in the original `AnalogSignal` object(s).
The function always returns the `AnalogSignal` objects, whether or not an in-place operation is performed.

However, the in-place operation only operated at the level of the data array, i.e., whenever the NumPy array from the original `AnalogSignal` was modified with the z-scored values, a new `AnalogSignal` object was created pointing to that NumPy array. Therefore, this has never been a true in-place operation, as the returned objects differed from the inputs.

This PR fixes that by returning the original `AnalogSignal` when `inplace` is True, and a new object (also using a different data array) when `inplace` is False.

Moreover, the units in the original `AnalogSignal` object were not modified when `inplace` is True and only the returned object was dimensionless (). Therefore, the original `AnalogSignal` ended up with z-scored values with a unit such as `uV`, which is misleading. The code in the PR now sets the unit to `dimensionless` in the original `AnalogSignal`.

Finally, the docstring mentioned that the in-place operation was not attempted if the `AnalogSignal` data type did not allow it (i.e., whenever the type was not float). The PR code now checks, for every object in the input list, whether the type allows the in-place operation. If `inplace` is True and this is not allowed, the parameter is ignored for that `AnalogSignal` (i.e., a copy will be returned along with a new `AnalogSignal` object), and a warning to the user is shown. Alternatively, this could be done before the main loop, checking if there is at least one object in the input list that does not allow the operation, and then setting `inplace` to False in that case (i.e., preventing any in-place operation at all).

To test the behavior of the updated function:

```
import numpy as np
import quantities as pq
import neo
from elephant.signal_processing import zscore

for inplace, dtype in ((True, np.int64), (False, np.int64),
                       (True, np.float64), (False, np.float64)):

    print("=======================")
    print(f"Inplace: {inplace}; dtype: {dtype}")

    test = neo.AnalogSignal(np.random.normal(10, 2, (60000, 96)),
                   units='uV', dtype=dtype, sampling_rate=30000*pq.Hz)

    zscored = zscore(test, inplace=inplace)

    print("IDs", id(test), id(zscored))
    print("Same object?", test is zscored)

    print(test[:1, :5])
    print(zscored[:1, :5])
    print("Equal data?", np.array_equal(test, zscored))
```
which produces

```
=======================
Inplace: True; dtype: <class 'numpy.int64'>
/home/koehler/PycharmProjects/elephant_fix/elephant/signal_processing.py:172: UserWarning: Could not perform inplace operation as the original signal dtype is not float. Source: None
  warnings.warn("Could not perform inplace operation as the "
IDs 139982366671472 139982321011504
Same object? False
[[11 10  8  8 10]] uV
[[ 0.73385822  0.25246159 -0.74701266 -0.74680096  0.24532251]] dimensionless
Equal data? False
=======================
Inplace: False; dtype: <class 'numpy.int64'>
IDs 139982321011840 139982321011728
Same object? False
[[13 12  8  5 10]] uV
[[ 1.74665356  1.23204397 -0.73947224 -2.22643084  0.24853166]] dimensionless
Equal data? False
=======================
Inplace: True; dtype: <class 'numpy.float64'>
IDs 139982321011616 139982321011616
Same object? True
[[ 0.4987234  -0.25468458 -1.32321378  0.41974894  0.32817535]] dimensionless
[[ 0.4987234  -0.25468458 -1.32321378  0.41974894  0.32817535]] dimensionless
Equal data? True
=======================
Inplace: False; dtype: <class 'numpy.float64'>
IDs 139982333189472 139982321011840
Same object? False
[[11.18127483  8.5491104  11.8618302  13.54534356 11.8022081 ]] uV
[[ 0.58965413 -0.73046345  0.93888403  1.77151628  0.89908117]] dimensionless
Equal data? False
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c54079a9733`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.