# Issue

**Title:** (feature): Add bounds_mip to get_bounds

## Description

This allows the user to define the mip of the bounds that are being passed to `get_bounds`. There are two specific reasons I did this: (1) I don't always inspect data at the MIP0 resolution, so I don't define bounds at that resolution and (2) I've encountered info files where resolutions are not consistent with a powers-of-two mip pyramid, which causes `vol.bbox_to_mip` to incorrectly adjust the bounds.

This isn't a breaking change, and I've only passed this ability to the `create_luminance_levels_tasks`.

In general, I like giving the user the option to define the MIP/resolution that they are using when passing any coordinates, rather than require a specific MIP/resolution, which may not always be clear to the user.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2df74db7e1a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.