# Issue

**Title:** adding MC to packaging of blackcap

## Description

## Description

**Why is this PR needed?**

As part of the latest round of reviews of the blackcap paper, we need to add an additional region (MC, caudal mesopallium) to the blackcap atlas

**What does this PR do?**
This PR
* adds the MC region during packaging
* smoothes it similarly to how the previous annotations were smoothed
* the smoothing function was made more re-useable by making it part of `atlas_generations/annotation_utils.py`
* simplifies and updates the blackcap packaging script to work with the latest code
* a one-off script to provide an equivalent ITKsnap compatible version of the atlas
* (one tiny tweak to a `mesh_utils.py` logging message)

Unlike previous annotations, MC was annotated in the male atlas space (not the previous mixed atlas space) so we can't easily incorporate directly with the [previous annotation combinations scripts](https://github.com/brainglobe/brainglobe-atlasapi/tree/main/atlas_scripts/pre_packaging/blackcap).

I have therefore chosen to integrate the region during packaging, where we are already in the correct space.

Atlas validation functions all pass.

@simonweiler has confirmed he is happy with the new region based on the two screenshots below
<img width="3072" height="1314" alt="image (9)" src="https://github.com/user-attachments/assets/70ef9c9b-9b63-4294-92ba-9d03ec7d4921" />

<img width="3072" height="1292" alt="image (10)" src="https://github.com/user-attachments/assets/bd5584bf-4eb9-4e50-ad70-d74152372fa4" />


The coronal section shows MC (light green) as a child region of M. The 3D view shows the root mesh, the M mesh and the MC mesh.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bcbf69ce6b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.