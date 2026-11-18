# Issue

**Title:** Update requirements

## Description

conda now defaults PyQt to PyQt5 which is not yet compatible with phy.

@nippoo I'll update soon the code from PyQt4 to PyQt5. Any argument against dropping PyQt4 support? I think it would be a pain to support both PyQt4 and PyQt5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13c591bcb112`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.