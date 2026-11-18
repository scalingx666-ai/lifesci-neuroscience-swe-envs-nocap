# Issue

**Title:** STYLE: Fix filename and dirname creation floating point formatting

## Description

Fix formatting of numbers that can be floats when creating filenames and dirnames: when transitioning to f-strings (commit ac6040f), it was assumed that `sigma` and `nonrigid_grid_resolution` would be integers, based on the existing formatting. However, these attributes can be set to non-integer values. The pre-f-string transition solution, e.g.:
```
"iteration_%05d_sigma_%05d" % (self.total_iterations, self.sigma)
```

trimmed the decimal part, and thus, for e.g. `total_iterations` 20 and `sigma` 7.5, it would produce:
```
'iteration_00020_sigma_00007'
```

With the introduction of f-strings, i.e.
```
f"iteration_{self.total_iterations:05d}_sigma_{self.sigma:05d}"
```

this would produce an error, since the `sigma` floating point value cannot be formatted as an integer:
```
{ValueError}ValueError("Unknown format code 'd' for object of type
'float'")
```

This patch set fixes the error by adopting the previous behavior: it trims the decimal part.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `165cfcdb321a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.