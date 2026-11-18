# Issue

**Title:** New way to distribute and install Expyriment

## Description

# Overview

The main change is the transition to distribute in wheel format (the new standard for Python), instead of zip and exe files.

This has benefits for both developers and users:
- Developers can now very quickly create and distribute a new (pre)release
- Users have it easier to install Expyriment (and its dependencies)
# Building a release
1. Create a git tag
2. `python setup.py bdist_wheel`
3. Done! The resulting wheel file includes Expyriment, (HTML) documentation, examples and scripts.

The wheel can now be uploaded to a GitHub release (alpha, beta, final) as well as PyPi (final).
# Installing Expyriment
1. Install Pygame
2. `pip install expyriment`
3. Done! PyOpenGL is automatically installed, documentation/examples/scripts go into `{sys.prefix}/share/expyriment/`

Additionally, Numpy and Pyserial can be installed (optional, if preprocessing and serial port communication is needed).

For simplified installation instructions for each platform, look at the updated Sphinx documentation about installing Expyriment!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `987b459568fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.