# Issue

**Title:** Add minimum dependencies test job and update installation documentation

## Description

This pull request adds continuous integration (CI) testing for the minimum supported dependency versions and documents these versions in the installation guide. Additionally, it makes minor improvements to the documentation of mathematical formulas in the `netneurotools/metrics/bct.py` module.

**Continuous Integration and Documentation Updates:**

* Added a new CI job (`run_min_deps_tests`) to `.github/workflows/tests-basic.yml` to test `netneurotools` with the minimum supported versions of key dependencies on Python 3.9. This ensures compatibility with older package versions.
* Updated `docs/installation.rst` to include a section listing the minimum tested versions of dependencies, reflecting the versions used in CI.

**Documentation Improvements:**

* Cleaned up the math formula documentation in `assortativity_und` and `assortativity_dir` by removing unnecessary LaTeX `align` environments, making the docstrings simpler and less error-prone. [[1]](diffhunk://#diff-9abb69a947f20fedd8cb535baaac9c086fd7730aa166484d1bec6b3604840a77L839-L856) [[2]](diffhunk://#diff-9abb69a947f20fedd8cb535baaac9c086fd7730aa166484d1bec6b3604840a77L950-L956) [[3]](diffhunk://#diff-9abb69a947f20fedd8cb535baaac9c086fd7730aa166484d1bec6b3604840a77L968-L975)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc2c43ba265f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.