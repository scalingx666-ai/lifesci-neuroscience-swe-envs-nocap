# Issue

**Title:** ENH - ft_test

## Description

Improved the output that is printed in the command window for `ft_test find_dependency`. For example, when you run: `ft_test find_dependency  test_bug46 test_bug1232 test_bug1891 test_bug1212`, the printed output is: _The test scripts: test_bug46 test_bug1232 test_bug1891 test_bug1212 depend on: ft_connectivityanalysis ft_selectdata ft_connectivity_wpli ft_layoutplot_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5595684a1d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.