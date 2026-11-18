# Issue

**Title:** Prevent zero underflow in volume

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Currently volume underflows when we subtract 1, as explained in the bug report. Because volume is unsigned so subtracting from zero will flow back to the max value, that actually means they become bright voxels.

Also, the z calculation shifts the z stack as explained there.

**What does this PR do?**

Prevent the underflow by not subtracting from zero entries. Also correctly calculates the z pos of processed middle planes.

## References

Fixes 

## How has this PR been tested?

Added a test. Functionality probably has changed though because it was incorrect before.

Without the fix, the newly added test prints the following when test:

```
================================================================================================================== FAILURES ==================================================================================================================
__________________________________________________________________________________________________________ test_underflow_issue_435 __________________________________________________________________________________________________________

    def test_underflow_issue_435():
        # two cells centered at (9, 10, 10), (17, 10, 10) with radius 4
        p1 = np.array([9, 10, 10])
        p2 = np.array([19, 10, 10])
        radius = 5

        bright_voxels = np.zeros((20, 20, 30), dtype=np.bool_)

        pos = np.empty((20, 20, 30, 3))
        pos[:, :, :, 0] = np.arange(20).reshape((-1, 1, 1))
        pos[:, :, :, 1] = np.arange(20).reshape((1, -1, 1))
        pos[:, :, :, 2] = np.arange(30).reshape((1, 1, -1))

        dist1 = pos - p1.reshape((1, 1, 1, 3))
        dist1 = np.sqrt(np.sum(np.square(dist1), axis=3))
        inside1 = dist1 <= radius
        dist2 = pos - p2.reshape((1, 1, 1, 3))
        dist2 = np.sqrt(np.sum(np.square(dist2), axis=3))
        inside2 = dist2 <= radius

        bright_voxels[np.logical_or(inside1, inside2)] = True
        bright_indices = np.argwhere(bright_voxels)

        centers = split_cells(bright_indices)

        # for some reason, same with pytorch, it's shifted by 1. Probably rounding
        expected = {(10, 11, 11), (18, 11, 11)}
        got = set(map(tuple, centers.tolist()))
>       assert expected == got
E       assert {(10, 11, 11), (18, 11, 11)} == {(10.0, 11.0,..., 11.0, 12.0)}
E
E         Extra items in the left set:
E         (18, 11, 11)
E         (10, 11, 11)
E         Extra items in the right set:
E         (10.0, 11.0, 12.0)
E         (12.0, 11.0, 11.0)
E         (18.0, 11.0, 12.0)
E         Use -v to get more diff

tests\core\test_integration\test_detection_structure_splitting.py:81: AssertionError

========================================================================================================== short test summary info ===========================================================================================================
FAILED tests/core/test_integration/test_detection_structure_splitting.py::test_underflow_issue_435 - assert {(10, 11, 11), (18, 11, 11)} == {(10.0, 11.0,..., 11.0, 12.0)}
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! stopping after 1 failures !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
===================================================================================================== 1 failed, 99 deselected in 21.21s ======================================================================================================
```

## Is this a breaking change?

Not in the API

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `848fd4ed8dce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.