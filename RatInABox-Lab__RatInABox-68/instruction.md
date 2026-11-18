# Issue

**Title:** TaskEnvironment: option to delay episode terminate

## Description

new option for TaskEnvironment `delay_episode_terminate`: how long to delay episode termination in seconds.

other local branch changes from my local branch…
    - instances of rewards and goals receive names (either automatically or from user)
    - rewardcache keeps stats now (how long inactive and max and min levels thus far)
    - a few cleanups (1 type annotation, 1 redundant param, 1 minor unhandled kwarg).
    - also SpatialGoalEnvironment now allows uploading goals that are not spatial into its cache.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd8ad87b58bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.