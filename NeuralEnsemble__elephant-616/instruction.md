# Issue

**Title:** [Fix] expired scipy deprecations, sp.sqrt

## Description

This pull request (PR) replaces the usage of the `sp.sqrt` function with `np.sqrt`.

The deprecation of sp.sqrt expired earlier than expected. Originally, it was planned to be removed with the release of scipy 2.0.0, but with scipy version greater than 1.10.1, unit tests are failing.

Deprecation was introduced in scipy 1.4.0:

https://docs.scipy.org/doc/scipy/release/1.4.0-notes.html#scipy-deprecations

Quote from the scipy release notes:

Support for NumPy functions exposed via the root SciPy namespace is deprecated and will be removed in 2.0.0. For example, if you use scipy.rand or scipy.diag, you should change your code to directly use numpy.random.default_rng or numpy.diag, respectively. They remain available in the currently continuing Scipy 1.x release series.

Further  deprecations  fixed:
- DeprecationWarning: 'scipy.integrate.simps' is deprecated in favour of 'scipy.integrate.simpson' and will be removed in SciPy 1.14.0
- DeprecationWarning: Importing gaussian from 'scipy.signal' is deprecated since SciPy 1.1.0 and will raise an error in SciPy 1.13.0. Please use 'scipy.signal.windows.gaussian' or the convenience function 'scipy.signal.get_window' instead.
- DeprecationWarning: 'scipy.integrate.cumtrapz' is deprecated in favour of 'scipy.integrate.cumulative_trapezoid' and will be removed in SciPy 1.14.0
- DeprecationWarning: You are passing x=[0.        ...      ] as a positional argument. Please change your invocation to use keyword arguments. From SciPy 1.14, passing these as positional arguments will result in an error.   F = simpson(I, x=xlin)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2df1b96a4d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.