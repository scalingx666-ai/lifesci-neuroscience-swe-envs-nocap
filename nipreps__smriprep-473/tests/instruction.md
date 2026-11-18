# Issue

**Title:** Resample surfaces to any space/density using Connectome Workbench.

## Description

Adding `init_resample_surfaces_wb_wf`, which is similar to `init_resample_surfaces_wf` but not limited to fsLR spaces.
It can resample surfaces to the specified space and density if the corresponding files exist in TemplateFlow.

For non-fsLR templates, it needs the `space-fsLR` files of the template, which connects the registered sphere (fsLR space) with the template (template space).
For example, with `tpl-onavg_space-fsLR_hemi-L_den-10k_sphere.surf.gii` it can resample the subject's surfaces to `space-onavg_hemi-L_den-10k`.

The code is mostly copied and modified from `init_resample_surfaces_wf`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d29e49c36534`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.