# Issue

**Title:** Refactor affine transformations and add deprecation utils

## Description

This pull request introduces several changes to the `kwave` utilities, focusing on handling deprecation warnings, improving affine transformations, and updating rotation matrix calculations. The most important changes include adding a deprecation utility, replacing `get_affine_matrix` with `make_affine`, and using `scipy.spatial.transform.Rotation` for rotation matrices.

### Deprecation Handling:
* Added a `deprecated` decorator in `kwave/utils/deprecation.py` to mark functions as deprecated and provide warnings.

### Affine Transformations:
* Replaced `get_affine_matrix` with `make_affine` in `kwave/utils/kwave_array.py` and `kwave/utils/math.py` to create affine transformation matrices. [[1]](diffhunk://#diff-6c919b1bd4c514a3c816c149174528774b4fc1558ee983ab43d5f7add8a12c21L683-R690) [[2]](diffhunk://#diff-63cb2fd7dc10cec621481625a6e3b12dab9566c98b152dbee6044fa9701072a6L309-R386)
* Deprecated `get_affine_matrix` in favor of `make_affine`.

### Rotation Matrices:
* Updated rotation matrix calculations to use `scipy.spatial.transform.Rotation` in `kwave/utils/mapgen.py` and `kwave/utils/math.py`. [[1]](diffhunk://#diff-287c99b222c6995856cb70faddfbff536a293ff0c6edaf623e8784323deaf2d7L2628-R2630) [[2]](diffhunk://#diff-63cb2fd7dc10cec621481625a6e3b12dab9566c98b152dbee6044fa9701072a6R5-R52) [[3]](diffhunk://#diff-63cb2fd7dc10cec621481625a6e3b12dab9566c98b152dbee6044fa9701072a6L309-R386)

### Code Refactor:
* Removed unused imports and reorganized imports in `kwave/utils/kwave_array.py` and `kwave/utils/mapgen.py`. [[1]](diffhunk://#diff-6c919b1bd4c514a3c816c149174528774b4fc1558ee983ab43d5f7add8a12c21L16-R18) [[2]](diffhunk://#diff-287c99b222c6995856cb70faddfbff536a293ff0c6edaf623e8784323deaf2d7R13-R17)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b78cd2a3078d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.