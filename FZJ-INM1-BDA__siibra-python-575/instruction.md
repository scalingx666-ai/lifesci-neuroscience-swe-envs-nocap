# Issue

**Title:** Read freesurfer .annot files as fsaverage mesh labels

## Description

```python
import siibra
from nilearn import plotting
conn = siibra.retrieval.repositories.GithubConnector("FZJ-INM1-BDA", "siibra-configurations", "add_visfAtlas")
siibra.use_configuration(conn)
mp = siibra.get_map(parcellation="visf", space="fsaverage")
mesh = mp.fetch(variant='inflated')
plotting.view_surf([mesh['verts'], mesh['faces']], surf_map=mesh['labels'], cmap=mp.get_colormap(), symmetric_cmap=False).open_in_browser()
```

See https://surfer.nmr.mgh.harvard.edu/fswiki/LabelsClutsAnnotationFiles for details of the freesurfer .annot files and https://nipy.org/nibabel/reference/nibabel.freesurfer.html#read-annot for implementation detail.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da6e33cbdb9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.