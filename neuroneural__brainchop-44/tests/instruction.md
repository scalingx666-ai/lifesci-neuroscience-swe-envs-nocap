# Issue

**Title:** Control WEBGL_DELETE_TEXTURE_THRESHOLD

## Description

This pull request implements a partial fix for . With this PR, more models run on that configuration. In addition, models in general run faster regardless of computer.

Previously, [brainchop used aggressive texture memory deallocation](https://github.com/neuroneural/brainchop/blob/098688a90efad3fa3e599f1ece360cd1fe3225f9/tensor-utils.js#L504):
```
tf.ENV.set('WEBGL_DELETE_TEXTURE_THRESHOLD', 0)
```

Now, this is only done if the user checks the `Compatibility (slow)` option. So the parameter is set to -1 by default (normal memory deallocation) and `0` if the user chooses the slow option. On my hardware, the normal (-1) was always faster and aided compatibility on Intel with Windows, while aggressive (0) was always slower (as expected) and did not actually improve compatibility. I decided to add a check box because my testing hardware is not exhaustive, perhaps there are cases where using the aggressive mode does help model execution.

![delete_textures](https://github.com/neuroneural/brainchop/assets/8930807/b1f3b84d-0f64-4c94-9a2b-ea3aa11d3457)

Long story short: this PR changes the default behavior for faster performance and more compatible behavior on the specific combination of an Intel GPU on the Windows operating system.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `098688a90efa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.