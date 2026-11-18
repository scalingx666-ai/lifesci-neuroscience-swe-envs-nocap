# Issue

**Title:** Feat: Force nodes/edges inside the mesh (postprocessing)

## Description

This PR added helper functions for by-wavefront skeletonization. Unlike the Better wavefront method in another PR, this is computationally light. The general idea is to detect nodes and edges outside the mesh, then move them into the mesh to obtain a "better" representation.

Simple usage is similar to the original function
```
skel = sk.skeletonize.by_wavefront(mesh, waves=waves, step_size=step_size,
                               inside_mode='nodes_edges',
                        center_mode='inside_mean')   
```
Use original method:
```
skel = sk.skeletonize.by_wavefront(mesh, waves=waves, step_size=step_size,
                               inside_mode='none',
                        center_mode='mean')   
```

Please find more details about the parameters in the update wave.py docstrings.

Attached is an example. The first image shows a skeleton with the original function, and the second image shows the "force inside" version of the skeleton generated from the same mesh.

<img width="381" height="418" alt="Original" src="https://github.com/user-attachments/assets/b54cb1cc-0270-4054-8f9a-e682e163f0a8" />

<img width="344" height="381" alt="Force inside" src="https://github.com/user-attachments/assets/7d498648-19dc-4434-91dc-ae037bfc5499" />

The bristles could be removed in post-processing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e171beed6d14`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.