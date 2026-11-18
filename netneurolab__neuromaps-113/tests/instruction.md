# Issue

**Title:** Filename update for CMRglc

## Description

Changed filename of the CMRglc PET data. It used to be `cmruglu` and is now `cmrglc` according to standard convention (see e.g. [Wikipedia](https://en.wikipedia.org/wiki/Glucose), or papers like [this one](https://doi.org/10.1097/00004647-199807000-00002)).

**IMPORTANT:** Before merging, we would need to update the folder and filename of CMRglc on [OSF](https://osf.io/4mw3a/) as well. It'd be awesome if someone with access to that repo could change it!

Also, changed tags in the raichle data from `MRI` to `PET` and added the tag `metabolism`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abc085acdc96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.