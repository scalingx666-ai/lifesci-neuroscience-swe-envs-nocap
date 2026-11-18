# Issue

**Title:** continuous integration using travis

## Description

This pull requests adds continuous integration using travis, see https://travis-ci.org/thorbenk/Knossos for the working setup for my branch.

(This includes  )

After merging
- go to https://travis-ci.org
- sign in with GitHub, and enable travis for the `Knossos` repository
  in your settings.
- Change the build status image in `README.md` to point to the master branch of your own repository!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f87cee35178f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.