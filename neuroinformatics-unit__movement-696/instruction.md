# Issue

**Title:** Add function to estimate perspective transform between two planes

## Description

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
In multi-session or multi-video experiments of the same setup, small shifts in the camera or setup can cause coordinate systems to differ between sessions. This prevents direct comparison or aggregation of tracked positional data across sessions. Even minor changes in angle, distance, or tilt can introduce perspective distortions that make one-to-one point correspondence unreliable without geometric alignment.

**What does this PR do?**
This PR adds functionality to compute homography transformations between sessions. This serves as the foundational step for aligning coordinate systems across recordings. A subsequent PR will integrate this functionality into the RegionOfInterest (RoI) class.

Key details:

- Implements a homography-based alignment suitable for planar scenes with perspective effects (where the camera is tilted, moved closer/further, or rotated, but the scene remains planar).
- Ensures at least four non-collinear, non-degenerate points are used to compute the transformation reliably.


## References


## How has this PR been tested?
This code was tested using multiple dummy problems in local. Some of the toy problems are also available in the unit tests.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
Yes.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5413011c501a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.