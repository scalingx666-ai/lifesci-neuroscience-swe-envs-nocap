# Issue

**Title:** Use correct directory for downloading atlases on CI

## Description

I found the issue: https://github.com/brainglobe/brainglobe-atlasapi/blob/638091910cc13ca8093a153beb3dd57f28c714b6/tests/conftest.py#L24-L28 The conditional statement was always true even on CI because the `GITHUB_ACTIONS` env variable wasn't being passed to `tox`. Since we only cache the `.brainglobe` directory it was downloading fresh atlases into a `.brainglobe-tests` directory on each run.

The env variable is now being passed back and the cache is being utilised correctly. It now takes ~12 minutes to run the tests. However, this should be sped up when the cache on main is refreshed with new atlases that have been added to the test suite since the last time the cache was used correctly. We can force a refresh by deleting the `brainglobe-{os}-18` caches on main after this is merged and rerunning the test action.

I've also updated one test where a fresh atlas was being downloaded to use the one we have in the cache. It would be nice to go through the testing suite and ensure we're only downloading a new atlas when required. GIN gets grumpy easily and harshly throttles connections leading to long test times.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `638091910cc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.