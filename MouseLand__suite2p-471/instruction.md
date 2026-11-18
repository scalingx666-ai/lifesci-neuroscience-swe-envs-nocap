# Issue

**Title:** Bugfix: Single version source

## Description

After #470, where the suite2p version number in setup.py stopped matching the git tag (and therefore, github release) number, I realized that we don't have clear ways to:

  -  ensure that the versions are always consistent between Pypi, the suite2p package, and Git
  -  ensure that users are providing correct version numbers (since there are multiple places they could be checking, especially if they aren't knowledgeable about where python installs things, or git branches)
  - have a simple way to check the version of the currently-installed suite2p.
  - ensure that the version number truly identifies the source code (i.e. if the version number is the same, then the code should be the same), to provide guarantees on reproducibility.

This pull request addresses that by anchoring everything to the latest git tag: the setuptools version, the PyPi release number, the GitHub release, the new `suite2p.version` variable, and the new CLI version function `suite2p --version` that prints the version number.  Updating the version is the same as before (just update the git tag), and the minor version number is calculated from commits after the tag, ensuring reproducibility and removing the need to manually check version number consistency.

The final benefit here is that it allows us to release new minor versions more often, so that users can easily download and upgrade their suite2p version from pypi and we as developers don't have commits on master that are intended to bypass the normal quality control and release processes.  If a single bugfix in dev is worth releasing to users, we can do it easily.

For more details on how this works behind the scenes:
   - Description of Travis, Git , Setuptools_scm workflow: https://medium.com/@Hironsan/automatically-releasing-your-python-package-to-pypi-using-travis-on-tagged-commits-64423e692440
  - Setuptools-scm readme (the tool that gets the version number from Git):  https://pypi.org/project/setuptools-scm/


To try it out in Python:
```python
import suite2p
print(suite2p.version)
```

From the terminal:
```
suite2p --version
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84c7feb2a9f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.