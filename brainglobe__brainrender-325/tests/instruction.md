# Issue

**Title:** User-specified colormap in PointsDensity

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
NA

**What does this PR do?**
Allows the user to specify a colormap for the points density feature.

## References



## How has this PR been tested?

I ran [examples/cell_density.py](https://github.com/brainglobe/brainrender/blob/main/examples/cell_density.py) example, https://github.com/brainglobe/brainrender/blob/980a76fee9796595561f99e760083cafea09f62d/examples/cell_density.py#L42

using `scene.add(PointsDensity(coordinates, colors="inferno"))` instead.

## Is this a breaking change?

I hope not

## Does this PR require an update to the documentation?

The PointsDensity is not documented in the documentation, so NA. We could add the colormap option in the example.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Notes
I'm unfamiliar with (read : I don't know anything about) tests and pre-commits, so I didn't do those. I used ruff to format my addition in VSCode, but that's about it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `980a76fee979`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.