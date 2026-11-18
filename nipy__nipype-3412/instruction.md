# Issue

**Title:** rename dipy `move_streamlines` to `transform_tracking_output`

## Description

The dipy function `move_streamlines` was removed (https://dipy.org/documentation/1.1.1./api_changes/) and later added back under a different name ().

I haven't been able to test this yet due to an unrelated error (#3413).

## Acknowledgment

* [x]  I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87d04aeb4cb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.