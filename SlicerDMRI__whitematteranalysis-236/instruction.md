# Issue

**Title:** STYLE: Fix registration process id string floating point formatting

## Description

Fix formatting of numbers that can be floats when creating the registration process id string: when transitioning to f-strings (commit ), it was assumed that `sigma` and `grid_resolution` would be integers, based on the existing formatting. However, these attributes can be set to non-integer values. The pre-f-string transition solution, e.g.:
```
"(...)_sigma_%03d_grid_%03d" % (subject_idx, iteration_count, sigma, grid_resolution)
```

trimmed the decimal part, and thus, for e.g. `sigma` 7.5 and `grid_resolution` 1.5, it would produce:
```
'(...)_sigma_007_grid_001'
```

With the introduction of f-strings, i.e.
```
f"(...)_sigma_{sigma:03d}_grid_{grid_resolution:03d}"
```

this would produce an error, since the `sigma` and `grid_resolution` floating point value cannot be formatted as an integer:
```
{ValueError}ValueError("Unknown format code 'd' for object of type
'float'")
```

This patch set fixes the error by adopting the previous behavior: it trims the decimal part.

Left behind in commit 

Limit the Pillow dependency to <10.4.0. Solves:
```
  File "/opt/hostedtoolcache/Python/3.8.18/x64/lib/python3.8/site-packages/PIL/_typing.py", line 10, in <module>
    NumpyArray = npt.NDArray[Any]
AttributeError: module 'numpy.typing' has no attribute 'NDArray'
```

raised for example at:
https://github.com/SlicerDMRI/whitematteranalysis/actions/runs/9821374452/job/27116961065?pr=236#step:6:175

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `364c5011779f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.