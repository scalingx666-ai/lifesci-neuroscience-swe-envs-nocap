# Issue

**Title:** Fix/update tutorials asset and unitary_event_analysis to use nixio 1.5.0

## Description

This PR addresses issue #435 . 
IO `neo.io.NeoHdf5IO` was removed from neo with the release of 0.10.0 

It will render PR #437 obsolete. As PR #437 still relies on nixio 1.5.0b3, this PR will go a step further and realize an upgrade to nixio 1.5.0.

The datasets used in the tutorials:
- asset.ipynb
- unitary_event_analysis.ipynb

have been updated to .nix file format and are now compatible with nixio >= 1.5.0.

A current build of the tutorials from this PR can be seen here:

UE tutorial: https://elephant-docs-development.readthedocs.io/en/fix-update_nixio_1.5.0/tutorials/unitary_event_analysis.html
ASSET tutorial: https://elephant-docs-development.readthedocs.io/en/fix-update_nixio_1.5.0/tutorials/asset.html

The links to the updated datasets on https://gin.g-node.org/INM-6/elephant-data PR # 6 have been added to the notebooks.

TODO: (to remove this PR from draft mode)
- [x] merge PR # 6 on gin.g-node /INM-6/elephant-data
- [x] update links in the tutorial notebooks accordingly

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e97479bd76bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.