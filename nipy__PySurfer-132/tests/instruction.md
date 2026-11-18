# Issue

**Title:** Check environment and run FreeSurferEnv.sh if necessary

## Description

Addresses #102.

Check `os.environ` and run `$FREESURFER_HOME/FreeSurferEnv.sh` if not the most recent script to edit the `PATH`. Parse the resulting environment and pass to `mri_vol2surf`, avoiding modifying the base process environment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bcdd7a08ccc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.