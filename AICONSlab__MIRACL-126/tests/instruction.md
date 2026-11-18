# Issue

**Title:** Finalize ACE docs and Minor Bugs

## Description

# This PR covers two areas:
1. Minor doc changes
2. Small bugs that came up when testing ACE


## Minor doc changes
- Update ACE documentation so that the example commands work for the sample data we have
- Add more details on how to get the ACE model files in the right location

## Small bugs that came up when testing ACE
- Ensure that the warp file always overwrites any existing warp file (before it would raise an error if a warp file already existed)
- Update the glob pattern to search for the existing conversion file. The glob would not work with single-digit downsample ratios
- Add printing of default vox downsample ratio in parser help
- Change the group for arg `--sa_percentage_brain_patch_skip` (used for skipping empty brain patches). It did not belong to the right parser group (seg) so it was not showing up.
- Update MIRACL GUI icon path to display the image in GUI mode
- Add folders for the ACE model files so that user does not need to create them

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `567dde3b6b98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.