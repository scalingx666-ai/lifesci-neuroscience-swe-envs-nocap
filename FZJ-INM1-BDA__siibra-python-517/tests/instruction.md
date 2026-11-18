# Issue

**Title:** Maint: parc.find_regions as module method. clarify find_regions

## Description

This PR addresses the following issues/points ():
- `parcellation.find_regions()` was a static method of `Parcellation` but it searches through all parcellations in the registry. For the user, when they have a parcellation instance `parc`, there is no clear difference between `parc.find_regions()` and `parc.find()` while they should be using `find` to search within the parcellation. (`find` is a method of `Region`).
- There is also `atlas.find_regions()` as an instance method. It behaves differently than  `parcellation.find_regions()`. Needs to be clarified.
- Finally, instead of using caching with a dictionary with keys of kwarg tuples, why not use `cache` property?
    - `lru_cache` might be necessary for long-running systems like siibra-api

(Please see the discussions on the code changes for further details)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b250f43faaaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.