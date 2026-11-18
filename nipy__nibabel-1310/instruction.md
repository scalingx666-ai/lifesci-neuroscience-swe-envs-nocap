# Issue

**Title:** Filter upstream warning raised by `np.finfo(np.longdouble)` on WSL1

## Description

## Description

This PR filters an upstream warning regarding broken support for `np.longdouble`, raised by `np.finfo(np.longdouble)` when `numpy>=1.25` is used on WSL1.

>```
> UserWarning: Signature b'\x00\xd0\xcc\xcc\xcc\xcc\xcc\xcc\xfb\xbf\x00\x00\x00\x00\x00\x00' for
> <class 'numpy.longdouble'> does not match any known type: falling back to type probe function.
> This warnings indicates broken support for the dtype!
>  machar = _get_machar(dtype)
>```

NB: The context in which `type_info` is called on `np.longdouble` is here:

https://github.com/nipy/nibabel/blob/0e925abb15e2dfbeecaaca4e7c2479b9d3e2cec0/nibabel/casting.py#L664-L670

https://github.com/nipy/nibabel/blob/0e925abb15e2dfbeecaaca4e7c2479b9d3e2cec0/nibabel/casting.py#L685

Given that `nibabel` already tries to avoid `np.longdouble` on Windows, I think it should be fine to filter this warning?

Notes:

- ~I've tried to detect WSL1 to avoid filtering warnings for any other platforms -- I wanted this to be as minimal a change as is necessary. But, maybe checking `uname` is a bit overkill. :sweat_smile:~ EDIT: Removed.
- I've tested that the filter works for our downstream package here: https://github.com/spinalcordtoolbox/spinalcordtoolbox/compare/master...jn/4411-test-upstream-nibabel-pr-np.longdouble
    - Before: https://github.com/spinalcordtoolbox/spinalcordtoolbox/actions/runs/8399514483/job/23005708102#step:9:474
   - After: https://github.com/spinalcordtoolbox/spinalcordtoolbox/actions/runs/8399514483/job/23011239904#step:9:474
- I've run the style checks, too. :)

## Related issues/PRs

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e925abb15e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.