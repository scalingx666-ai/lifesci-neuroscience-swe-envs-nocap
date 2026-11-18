# Issue

**Title:** New download_from_stash

## Description

Downloads the entire zip and then unpacks specific content from it.

Tested on Python2 only for now (and only on Windows 10).

TODO:
* Testing on Python 3 and other OS
* Implement a way to dynamically set the current tag as default branch
* Think about whether we want the URL to be hardcoded or not

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4a95dbedcf6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.