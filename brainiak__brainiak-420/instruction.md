# Issue

**Title:** Updated ISCs with array-style correlation

## Description

@CameronTEllis I moved your new function to `brainiak.utils.utils.py` and modified it a bit (renamed to `array_correlation`). Expanded the tests a bit as well. For the `isc` function, we're now using this for the two-subject case and for the leave-one-out approach for substantive speed boosts. I've left the pairwise approach largely as it was (using a voxel loop and `np.corrcoef`, as the `array_correlation` version is only faster with relatively few subjects (due to large number of subject pairs). The `run-checks.py`, `test_utils.py`, and `test_isc.py` all pass on my end.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4dba500dafcc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.