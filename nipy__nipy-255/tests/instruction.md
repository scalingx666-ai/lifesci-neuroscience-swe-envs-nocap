# Issue

**Title:** Py3 csv fixes

## Description

More detailed testing revealed a subtle error in csv file handling for Python 3 and windows.  The errors are the first and second errors here:

http://nipy.bic.berkeley.edu/builders/nipy-bdist32-32/builds/4/steps/shell_4/logs/stdio

It turned out that csv files need to be opened in different modes on python 2 and 3.  Make a compatibility wrapper for that and work round it in one example where that might be an issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71be6e983e12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.