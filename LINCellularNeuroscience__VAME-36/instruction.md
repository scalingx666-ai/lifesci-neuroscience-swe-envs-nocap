# Issue

**Title:** minor fix for file_format & easy reinstall.sh

## Description

I ran into a minor issue with not being able to pass non-mp4 files  to `vame.gif` (always looked for `mp4` if `subtract_background =True`). Here is the simple fix! (Also, the formatting is auto-fixed in atom-- apologies, not sure how to not fix it ... )

I also added a reinstall.sh script (simply run `./reinstall.sh` in the VAME folder for fast uninstall / reinstall for testing).

I bumped your setu.py to 1.0 since you mention this in your release ;)

Also, behavior of convert csv to numpy changed, so I updated the docstring to reflect this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `705a709be36b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.