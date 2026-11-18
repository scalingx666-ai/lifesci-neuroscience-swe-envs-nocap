# Issue

**Title:** rf(py314): Replace deprecated pkgutil.find_loader

## Description

This PR removes [pkgutil.find_loader()][] and replaces it with [importlib.util.find_spec()][]. `find_loader` was deprecated in Python 3.12 and will be removed in 3.14. `find_spec` has been present since Python 3.4.

Both functions return `None` if the module loader cannot be found. For its use in this project, this is sufficient and no translation of the return value is needed.

[pkgutil.find_loader()]: https://docs.python.org/3/library/pkgutil.html#pkgutil.get_loader
[importlib.util.find_spec()]: https://docs.python.org/3/library/importlib.html#importlib.util.find_spec

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d7a6d31de9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.