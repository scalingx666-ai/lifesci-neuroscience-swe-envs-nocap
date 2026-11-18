# Issue

**Title:** call kimimaro.skeletontricks.roll_invalidation_ball_inside_component using positional-only arguments

## Description

https://github.com/seung-lab/kimimaro/blob/c9e58f677d522d7b7f3c72c75d9fa768bb5e5e71/ext/skeletontricks/skeletontricks.pyx#L372
https://stackoverflow.com/questions/68380123/cythonized-function-with-a-single-positional-argument-is-not-possible-to-call-us

Cython by default does not allow positional arguments to be specified in a kwargs-like style. This fix stops `kimimaro.skeletonize` from raising `TypeError: roll _invalidation_ball_inside_component() takes at least 6 positional arguments`, which is introduced in

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9e58f677d52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.