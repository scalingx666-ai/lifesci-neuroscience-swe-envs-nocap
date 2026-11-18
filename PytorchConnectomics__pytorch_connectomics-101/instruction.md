# Issue

**Title:** Fixes #98 - Enable the use of `dataset_volume.py` for unsupervised cases (label/mask = None)

## Description

I added multiple switches to `dataset_volume.py`  that ensure its functionality in the case that labels and/or valid_mask is set to None. 

I tested my adaptation with dummy data for the following cases:
* `mode='train', volume=data, lable=data,  valid_mask=data`
* `mode='train', volume=data, lable=None,  valid_mask=data`
* `mode='train', volume=data, lable=data,  valid_mask=None`
* `mode='train', volume=data, lable=None,  valid_mask=None`

* `mode='test', volume=data, lable=data,  valid_mask=data`
* `mode='test', volume=data, lable=None,  valid_mask=data`
* `mode='test', volume=data, lable=data,  valid_mask=None`
* `mode='test', volume=data, lable=None,  valid_mask=None`

*  `mode='val', volume=data, lable=data,  valid_mask=data`
* `mode='val', volume=data, lable=None,  valid_mask=data`
* `mode='val', volume=data, lable=data,  valid_mask=None`
* `mode='val', volume=data, lable=None,  valid_mask=None`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bace2c801e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.