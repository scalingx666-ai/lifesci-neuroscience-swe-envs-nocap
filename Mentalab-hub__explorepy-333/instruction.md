# Issue

**Title:** Update docs

## Description

- Updated the authors.rst to remove the mentalab.com from the names and added mail addresses for @salman2135 and @SonjaSt
- Added the liblsl requirement for all OS installations (installation.rst)
- Removed the blueutil thing from Mac installation (installation.rst)
- Changed Python 3.10 to 3.12 in the installation steps
- Changed recommended Python version to 3.12
- Changed explanation of installation of the GUI
- Changed some wording (virtual environment to conda environment, Conda prompt to Anaconda prompt etc.)
- Changed link for Anaconda installer to general download page

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9fdf40635821`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.