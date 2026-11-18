# Issue

**Title:** RF: make .travis.yml use travis Python and wheels

## Description

We were using erlang as language and apt-get for dependencies, because of the
difficulty getting numpy, scipy onto the travis slaves when using the standard
travis Python virtualenvs.

Now travis has numpy in the virtualenvs, and astropy, nipy.bic have wheels for
the travis slaves, so installation is much quicker.  This commit switches back
to using the travis Python testing machinery.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91fddffbae25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.