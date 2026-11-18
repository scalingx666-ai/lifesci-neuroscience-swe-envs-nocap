# Issue

**Title:** fix: retrieving meshes for a region present in the onthology but absent in the annotation atlas

## Description

## Description

**What is this PR**
Bug fix

**Why is this PR needed?**
Sometimes you want to display some regions by selecting them in the onthology. However you don't always know if they have a corresponding mesh. An example is `RSPd4` in Allen's CCFv3

**What does this PR do?**
Skip those problematic regions

## How has this PR been tested?
```python
import brainrender
atlas = brainrender.Atlas("allen_mouse_25um")
print(atlas.get_region("RSPd4", "RSPd5"))
```
the above code crashes without this PR. With it, it just adds region RSPd4

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a14ead80c1db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.