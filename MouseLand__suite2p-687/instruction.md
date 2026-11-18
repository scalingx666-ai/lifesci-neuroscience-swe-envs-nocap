# Issue

**Title:** Remove pyqt from base pip install

## Description

This removes the gui imports from `__init__.py`, so that suite2p can be installed and used if qt is not present (i.e. batch).  If you wish to have the gui conditionally loaded if packages are available, we could wrap the import in a try/except.  But IMHO its cleaner for those needing the gui to `import suite2p.gui`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59dfe8b4d388`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.