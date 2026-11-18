# Issue

**Title:** Allow custom atlases without specifying check_latest = False

## Description

## Description
as of v3 a change in behaviour was introduced which meant that the remote version was always queried, with the package raising an error when an atlas had no remote version. The workaround was to specify check_latest=False. This however would require us introducing specific logic into all dependencies so as to support custom atlases (or universally disable check latest). 

This PR returns to the previous behaviour where if an atlas has a local path but no remote it will load just fine. 

Before 
```python
>>> from brainglobe_atlasapi import BrainGlobeAtlas
>>> atlas = BrainGlobeAtlas("nmt_arm_sym_macaque_250um")
```
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
    atlas = BrainGlobeAtlas("nmt_arm_sym_macaque_250um")
  File "/home/harrycarey/anaconda3/lib/python3.13/site-packages/brainglobe_atlasapi/bg_atlas.py", line 119, in __init__
    self.check_latest_version()
    ~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/home/harrycarey/anaconda3/lib/python3.13/site-packages/brainglobe_atlasapi/bg_atlas.py", line 440, in check_latest_version
    remote_version = self.remote_version
                     ^^^^^^^^^^^^^^^^^^^
  File "/home/harrycarey/anaconda3/lib/python3.13/site-packages/brainglobe_atlasapi/bg_atlas.py", line 200, in remote_version
    raise FileNotFoundError(
        f"{self.atlas_name} is not a valid atlas name!"
    )
FileNotFoundError: nmt_arm_sym_macaque_250um is not a valid atlas name!
```

After
```python
>>> from brainglobe_atlasapi import BrainGlobeAtlas
>>> atlas = BrainGlobeAtlas("nmt_arm_sym_macaque_250um")
>>> atlas
nmt arm sym macaque atlas (res. 250um)
```

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other


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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e5bc72853f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.