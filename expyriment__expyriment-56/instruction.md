# Issue

**Title:** New setup

## Description

This is an attempt to make Expyriment PIP compatible. As far as my testing goes, this should be the case now.

For upload in the PyPi shop, we also need a PkgInfo file.

I also added an additional URL with Pygame and NumPy builds for windows.
This means, that theoretically, once Experiment is in PyPi, on Windows, a simple `pip install expyriment` should install everything (including Pygame, PyOpenGL, NumPy, PySerial and Pillow! In fact, the only thing not available is PyParallel, but I got rid of this for Windows anyway, see other pull request).

For OS X, however, this will not work, since there are no PyGame wheels for OS X (or at least I could not find them).

On Linux, it might work, if a compiler is installed.

But it is a first step, and for Windows users, things would get much better (and we would not have to build the Windows installer anymore!).

Let me know what you think.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09c5579e4d3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.