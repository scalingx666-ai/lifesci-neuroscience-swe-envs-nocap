# Issue

**Title:** CLI enhancements

## Description

Particularly useful during development and debugging
- `--pdb`: enable the IPython debugger
- `--ipython`: enable interactive IPython with the GUI
- `--prof`: profiler (saved in `.profile/stats.txt`)
- `--lprof`: line profiler (saved in `.profile/stats.txt`), need to specify profiled function with `@profile` decorator in the code

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62ad3cb379ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.