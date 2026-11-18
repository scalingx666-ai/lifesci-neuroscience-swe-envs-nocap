# Issue

**Title:** ENH: Resample BOLD data to any surface template space using the Connectome Workbench

## Description

## Changes proposed in this pull request

Currently in fMRIPrep the Connectome Workbench is used to resample BOLD data to fsLR spaces, as part of the CIFTI workflow.
This PR allows resampling BOLD data to any surface template space with a similar workflow, as long as (a) the "space-fsLR" spheres exist for the template (e.g., "tpl-onavg_space-fsLR_hemi-R_den-41k_sphere.surf.gii") or (b) the template is "fsLR".

In the long run, we might want to generate alternative generic workflows, e.g., (a) using the  of nitransforms by @Shotgunosine and me, and (b) using FreeSurfer's resampling workflow.

This PR depends on  and updating TemplateFlow's files on AWS S3.
Currently [the wrong subfolder on S3 was updated](https://github.com/templateflow/tpl-onavg/actions/runs/14868227699/job/41750227920#step:3:182) for some unknown reason.

This generic resampling workflow might serve as the first step for the .

## Documentation that should be reviewed

I've updated the workflows' docstrings accordingly, but feel free to make suggestions/edits.

@effigies @oesteban

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd2075b50477`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.