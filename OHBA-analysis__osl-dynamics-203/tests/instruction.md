# Issue

**Title:** Bugs in thresholding and saving FC networks

## Description

In `analysis.connectivity`, I encountered likely bugs in `threshold()` and `save()` functions.

### 1. Thresholding connectivity maps
When thresholding a symmetric connectivity matrix, we exclude the diagonal elements from thresholding after turning them into `np.nan`. 

However, I noticed that since `edges` is initiated with `np.empty()`, the diagonal elements are set to either True or False depending on the memory allocation. This caused some breaks during visualization and messed up with a distribution of thresholded values. 

Three possible ways to change this are:

- Set edge values for the diagonal elements as `False`.
- Set edge values for the diagonal elements as `True`.
- Include the diagonal elements in the thresholding.

I implemented the first option, as I thought this would be most relevant to our use case.

### 2. Saving connectivity maps
Nesting the plotting portion within the if-else loop will result in the function doing nothing when `output_file=None`. I took out this part from the loop, as in the `save_interactive()` function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e9f46a82418`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.