# Issue

**Title:** fix bugs in `truncated_normal`

## Description

## Description
`truncated_normal` in `brainpy.math.random` calls `jr.uniform` to sample from a uniform distribution and then inverse the cdf to get truncated values. 

`jr.uniform` samples from a *closed* interval. When `lower` or `upper` takes inf values and when `jr.uniform` sampled an extreme value, the inverse cdf would have inf values, which result in underflow values after clipping.

Fix: subtract and add a small value to `minval` and `maxval` arguments of `jr.uniform`.

## How Has This Been Tested


## Types of changes
- Bug fix (non-breaking change which fixes an issue)


## Checklist
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] Code follows the code style of this project.
- [x] Changes follow the **CONTRIBUTING** guidelines.
- [x] Update necessary documentation accordingly.
- [x] Lint and tests pass locally with the changes.
- [x] Check issues and pull requests first. You don't want to duplicate effort.

## Other information

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43b933ef9f02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.