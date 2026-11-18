# Issue

**Title:** [ENH] Changes related to Issue #81

## Description

I've made some changes related to Issue #81 including:
- added `fsaverage` maps for [beliveau2017](https://xtra.nru.dk/FS5ht-atlas/) and [norgaard2021](https://xtra.nru.dk/BZR-atlas/) data 
- added a warning to the docs (under "transformations") about volume-to-surface transformations of PET data
- added a warning that gets printed whenever users fetch `beliveau2017` or `norgaard2021` data in `MNI152` space, that says that the `fsaverage` versions should be used instead

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62ba01851fda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.