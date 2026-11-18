# Issue

**Title:** Fix "amsgrad" is used before being defined when initializing the AdamW optimizer

## Description

When initializing the "AdamW" optimizer, property "amsgrad" is used before it is defined. Therefore the following code generates error: ```AttributeError: 'AdamW' object has no attribute 'amsgrad'```.

```python
import brainpy as bp
import brainpy.math as bm

weights = {'weight': bm.TrainVar(bm.zeros(10))}
optimizer = bp.optim.AdamW(lr=0.01, train_vars=weights)
```

This PR fixes this error.

## Types of changes
<!--- What types of changes does your code introduce? -->
<!--- Only left the line that best describes this pull request -->
- Bug fix (non-breaking change which fixes an issue)

## Checklist
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] Code follows the code style of this project.
- [x] Changes follow the **CONTRIBUTING** guidelines.
- [x] Update necessary documentation accordingly.
- [x] Lint and tests pass locally with the changes.
- [x] Check issues and pull requests first. You don't want to duplicate effort.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87858c54b4f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.