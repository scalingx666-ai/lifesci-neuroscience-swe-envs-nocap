# Issue

**Title:** Resize symmetrically and avoid recreating grid.

## Description

The function neuron.utils.resize is asymmetric: when upsampling e.g. by a factor of 2, the function will evaluate a grid of size N on a grid of size 2N-1 and append the last element a second time. Attached is a short example. Not recreating the grid (by calling neuron.utils.transform) will make the function more efficient, too. [resize-example.txt](https://github.com/adalca/neuron/files/3490357/resize-example.txt)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f356f3519b1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.