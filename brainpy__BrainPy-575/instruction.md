# Issue

**Title:** fix bugs in  truncated_normal; add TruncatedNormal init.

## Description

<!--- Provide a general summary of your changes in the Title above -->
<!--- Please do remember to follow the contributing guidelines -->

## Description
1. `random.truncated_normal` is not properly truncated. 
2. add support for `TruncatedNormal` initialization
bug fix is a re-implementation of PR#574, also fix bugs therein.
Passed local test.


## Types of changes
- Bug fix (non-breaking change which fixes an issue)
- New feature (non-breaking change which adds functionality)


## Checklist
- [x] Code follows the code style of this project.
- [x] Changes follow the **CONTRIBUTING** guidelines.
- [x] Update necessary documentation accordingly.
- [x] Lint and tests pass locally with the changes.
- [x] Check issues and pull requests first. You don't want to duplicate effort.

## Other information

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `586cb0cb3d0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.