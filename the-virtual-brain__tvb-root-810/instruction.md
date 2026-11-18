# Issue

**Title:** TVB-3175. Make TVB compatible with latest siibra

## Description

Removed the siibra version limit (tested with 1.0.1a25, 1.0.1a26 and 1.0.1a27).

In the new versions, the HCP subject IDs for Julich 3.1 are 000-199 instead of 101309 etc., so I updated the default subject, the help text and the test IDs.

pytest 9.2.0 broke pytest-benchmark (), so I limited pytest to <9.2 for a while. pytest-benchmark 5.3.1 fixed it, so the limit is removed again.

Updated requires-python to >=3.9, added Python 3.12 and 3.13 to the classifiers and removed an unused test fixture that used the old siibra API.

Fixed the simulation in the siibra demo notebook, which gave NaN and inf because of the large siibra weights, by scaling the weights before the simulation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c033c101e7f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.