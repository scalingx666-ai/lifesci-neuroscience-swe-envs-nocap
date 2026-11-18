# Issue

**Title:** Point subject 5 and 8 ROI-mask downloads at their roi_masks folders

## Description

For subjects 5 and 8, `data/scripts/download/download_roi_masks` points at the subject's top-level Drive folder (which contains `roi_masks/`, `training_split/` and `test_split/`), while the other six subjects point directly at their `roi_masks/` folder.

The script still works, because `gdown --folder --json` lists subfolders recursively and the filename filter picks out the right files. For these two subjects it has to list about 5,700–5,900 entries (including the training images) instead of 32, which is slower (about 25 s vs 1–2 s here) and relies on the recursive listing.

This PR swaps in the IDs of the two `roi_masks/` subfolders so all eight subjects are consistent. I checked that the new folders list the same 32 files and that the script keeps the same `lh/rh.all-vertices_fsaverage_space.npy` files as before.

Thanks for releasing the code and checkpoints!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfb48b5d1418`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.