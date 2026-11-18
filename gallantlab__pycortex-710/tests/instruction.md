# Issue

**Title:** docs(utils): filled out docstrings

## Description

Fixes several on-website functions in cortex/utils.py:
- get_ctmpack: empty Returns entry (ctmfile) now has a type/description.
- get_vox_dist: undocumented `surface` parameter added.
- get_hemi_masks: undocumented `type` param and empty Returns filled in.
- add_roi: added a Returns section (it does return sp.call's exit code or None), and expanded its forwarded **kwargs (-> make_png) instead of a generic "passed to X" pointer.
- get_dropout: undocumented `power` param filled in.
- make_movie: filled in `stim`/`outfile` params, removed a stray empty Returns section (the function returns None).
- vertex_to_voxel: added a missing summary line and filled in the empty Returns section (it does return a real array).
- get_ctmmap: expanded forwarded **kwargs (-> get_ctmpack) individually.
- get_aseg_mask: documented its **kwargs as currently non-functional -- they're forwarded to anat2epispace, whose signature doesn't accept extra kwargs, so passing anything raises TypeError. Left as a documentation note; the underlying bug is out of scope for this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f8797a82898`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.