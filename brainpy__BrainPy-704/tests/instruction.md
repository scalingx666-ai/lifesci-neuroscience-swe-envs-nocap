# Issue

**Title:** [dnn] Improve error handling in `dnn/linear` module

## Description

This pull request includes several updates to the `brainpy` library, focusing on dependency management and error handling improvements. The most important changes involve adding a new dependency, refining error handling for missing packages, and updating documentation to reflect these changes.



### Dependency Management:
* Added `braintaichi` to the list of dependencies in `docker/requirements.txt`.

### Error Handling:
* Replaced `PackageMissingError` with `raise_braintaichi_not_found()` in multiple functions to provide a more specific error message when `braintaichi` is not found in `brainpy/_src/dnn/linear.py`. [[1]](diffhunk://#diff-77f7b5741aa049070a3ddbcb76c626e7e0e239b6602e1a80c41ccaf60598f93bL324-R324) [[2]](diffhunk://#diff-77f7b5741aa049070a3ddbcb76c626e7e0e239b6602e1a80c41ccaf60598f93bL344-R344) [[3]](diffhunk://#diff-77f7b5741aa049070a3ddbcb76c626e7e0e239b6602e1a80c41ccaf60598f93bL855-R855) [[4]](diffhunk://#diff-77f7b5741aa049070a3ddbcb76c626e7e0e239b6602e1a80c41ccaf60598f93bL877-R877) [[5]](diffhunk://#diff-77f7b5741aa049070a3ddbcb76c626e7e0e239b6602e1a80c41ccaf60598f93bL900-R900)
* Updated conditional checks to include `bti` in addition to `ti` in several functions to ensure proper handling when both dependencies are required in `brainpy/_src/dnn/linear.py`. [[1]](diffhunk://#diff-77f7b5741aa049070a3ddbcb76c626e7e0e239b6602e1a80c41ccaf60598f93bL244-R244) [[2]](diffhunk://#diff-77f7b5741aa049070a3ddbcb76c626e7e0e239b6602e1a80c41ccaf60598f93bL731-R731)

### Documentation Updates:
* Removed references to `brainpylib` and updated installation instructions to reflect the new dependency requirements in `docs/quickstart/installation.rst`. [[1]](diffhunk://#diff-5994dbcecc59b217816c230c84eb87159fca74712f3b0e59951b8da349aa1832L39) [[2]](diffhunk://#diff-5994dbcecc59b217816c230c84eb87159fca74712f3b0e59951b8da349aa1832L67) [[3]](diffhunk://#diff-5994dbcecc59b217816c230c84eb87159fca74712f3b0e59951b8da349aa1832L82-L103)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a354bf24ddd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.