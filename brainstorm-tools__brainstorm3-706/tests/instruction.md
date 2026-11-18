# Issue

**Title:** Contactsheets for 3D-slices behave as 3D-surfaces

## Description

This PR has as goal to have the same functionality in ContactSheets for 3D figures: MRI slices and surfaces. The difference was reported in this Forum thread: 

https://neuroimage.usc.edu/forums/t/45757/10

With these changes, contact sheets from 3D MRI slices will now have:

* Time stamp
* Colorbar 

These two elements will be hidden (as the current behaviour) if and only if there is not data (sources and TF) plotted on the MRI slices, AND volume contact sheets are requested.

For MRI slices: contactsheet `Time` with `Data` (source values)
| Before      | With this PR |
| ----------- | ----------- |
| ![img_1_1](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/81e1081b-b764-4d31-b25c-8508d445a8f2) | ![img_1_2](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/9b90e464-4ed2-4653-a862-8f1e506ecd3d) |

For MRI slices: contactsheet `Volume` without Data
| Before      | With this PR |
| ----------- | ----------- |
| ![img_2_1](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/770c064e-5738-487e-b00e-708f7d347b75) | ![img_2_2](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/b15bdfba-4c9b-415c-b3d6-5fdec0e6226f) |

EDIT: Images have been updated to current state of PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91d9d70c1586`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.