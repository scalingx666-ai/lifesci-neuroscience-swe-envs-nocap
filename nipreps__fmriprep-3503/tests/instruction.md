# Issue

**Title:** chore: Replace conda with pixi and lock

## Description

This PR replaces the conda+pip locks with [pixi](https://pixi.sh), which allows us to have a single lockfile.

In passing, I also started installing AFNI tools from their Docker builds, moved the template fetch and MSM download into their own layers. Since this somehow caused me to re-fetch FreeSurfer, I went ahead and updated the base image.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2120f863e300`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.