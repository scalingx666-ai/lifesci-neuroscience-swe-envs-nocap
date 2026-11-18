# Issue

**Title:** Remove setting of user-dependent FXAA vedo setting

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Brainrender examples don't render correctly on some machines -  and related forum discussion

**What does this PR do?**
Removes the explicit setting of a `vedo` setting that messes with rendering.

## References

 

## How has this PR been tested?

Local running of 
```
import brainrender
scene=brainrender.Scene(atlas_name="allen_mouse_25um")
scene.render()
```

## Is this a breaking change?

Yes, if anyone was relying on `use_FXAA` being set to true.

## Does this PR require an update to the documentation?
Don't think this was documented anywhere in the first place, so not specifically?

## Checklist:

- [x] The code has been tested locally (manually)
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69a2aeabd3fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.