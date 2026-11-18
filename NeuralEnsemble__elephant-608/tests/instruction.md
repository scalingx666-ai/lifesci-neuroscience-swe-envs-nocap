# Issue

**Title:** [ENH] Move to pyproject.toml

## Description

This is a long one!

# Original PR Body by Moritz
This PR moves Elephant from setup.py to pyproject.toml, aligning with PEP 518.

Key changes include:

- Introduction of `pyproject.toml`
- `setup.py` is still needed to compile the C-code for the fim module.

The reason is that we need OS dependend compile args which are dynamically defined in `setup.py`.
The `pyproject.toml` does not natively support conditional logic like os_name == 'windows' directly within the configuration. The TOML format is static and doesn't allow for dynamic evaluation of conditions based on the operating system.

To achieve platform-specific compile arguments, we have to use a Python script, such as a `setup.py`, which can programmatically determine the OS and apply the correct compile arguments.

In this context, as a configuration file for setuptools, `setup.py` is not deprecated, see also: https://packaging.python.org/en/latest/discussions/setup-py-deprecated/

---
# Changes

## pyproject.toml
- Created `pyproject.toml` with full project metadata (name, version, description, authors, license,
  URLs, classifiers)
- Moved to the SPDX licence expression format per PEP 639; removed the legacy `License ::` classifier string
- Switched to auto-discovery of packages via `setuptools.find_packages()`, this correctly picks up
subpackages such as `elephant.asset`
- Added `include-package-data = true` so non-Python data files are included in the wheel install
- Added classifiers for Python 3.13 and 3.14
- Removed the long-unused `six` dependency
- Added `viziphant` to the `tutorials` optional-dependency group
- Dependencies are now declared via [dynamic metadata](https://setuptools.pypa.io/en/latest/userguide/pyproject_config.html#dynamic-metadata), pointing back to the `requirements/*.txt` files. This keeps a single source of truth for dependencies

## CI modernisation (`.github/workflows/CI.yml`)
- **Merged pip test jobs**: Three separate pip-test jobs (Ubuntu, macOS, Windows) merged into a single job with `matrix.include`, eliminating duplication
- **Composite action**: Added a composite action(`.github/actions/restore-elephant-data`) to avoid code duplication of restore action that restored cached elephant-dataset and is shared by the pip, MPI and conda jobs
- Enabled `enableCrossOsArchive: true` on the data cache so a cache built on one OS can be restored on
another, this was added to build to both restore action and cache build action (`.github/workflows/cache_elephant_data.yml`)
- Bumped `actions/cache/`, `actions/setup-python` and `actions/checkout` to newer versions to fix issue with Node.js 20 actions being deprecated
- Made python version common accross jobs
- **Per-job coveralls uploads + finish job**: every job now uploads its own partial coverage report to coveralls, and a new `finish` job combines them at the end. This is to fix the earlier race condition where last coverall job was being usede to add PR comment.
- Added `pytest-cov` to `requirements/requirements-tests.txt` to avoid duplicate install steps for each job
- **Fast CI mode**: added a `fast` workflow-dispatch boolean input that limits the matrix to a subset of jobs
- Cleaned up workflow triggers 
- Cleaned up the DOC BUILD and DOC TEST jobs

## Environment files
- Refactored `requirements/environment*.yml` conda environment files to import from the corresponding `requirements/*.txt` files instead of duplicating the dependency list (system-level conda-only packages are still listed directly) 

## Bug fix for Windows path
- `elephant/datasets.py`: switched to `local_file.as_posix()` when constructing the `ValueError` message in `download_datasets`. On Windows, `pathlib` rendered backslashes, causing `test_download_with_cache_dir_with_failed_integrity_check` to fail because the assertion looks for the POSIX-style `repo_path` substring.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `354df0875b84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.