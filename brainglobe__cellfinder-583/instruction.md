# Issue

**Title:** Optimisation: vectorised indexing to replace loop in coords_to_volume

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
`coords_to_volume` sets each point in a Python loop, which is slow for large point sets. Vectorized indexing removes Python overhead and improves performance. Issue: #582.

**What does this PR do?**
Replaces the per-point loop in `coords_to_volume` with a single vectorized assignment:
`volume[relative_xs, relative_ys, relative_zs] = threshold_value`.

## References



## How has this PR been tested?

Not run locally in this environment.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [X] The code has been tested locally
- [X] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [X] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63f45e2e2cd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.