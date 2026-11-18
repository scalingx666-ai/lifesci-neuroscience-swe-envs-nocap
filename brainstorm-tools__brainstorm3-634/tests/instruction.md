# Issue

**Title:** Export ROI as Freesurfer annotation

## Description

This PR is doing three things : 
- Give a better error when trying to export multiple ROI using FreeSurfer label format (that only support on ROI per file)
https://surfer.nmr.mgh.harvard.edu/fswiki/LabelsClutsAnnotationFiles

- Export multiple ROI as annotation files   https://surfer.nmr.mgh.harvard.edu/fswiki/AnnotFiles 
- Fix a small bug in the reading of annotation file  https://surfer.nmr.mgh.harvard.edu/fswiki/LabelsClutsAnnotationFiles#Annotationfiledesignsurprise

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78cfcc44b9c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.