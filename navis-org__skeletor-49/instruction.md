# Issue

**Title:** Feat: Improved wavefront method

## Description

This PR adds a modified version of the wavefront skeletonization in which the wave travels exactly a user-defined distance along the edges of the mesh at each step instead of hopping from vertex to vertex. 

## Advantages
- works much better on coarse meshes or meshes with inhomogenous details 

## Disadvantages
- computationally more expensive (~3-4x)
- because this doesn't operate directly on the vertices (but rather the edges between them) there is no 1:1 correspondence between mesh vertices and skeleton nodes (i.e. no `mesh_map`) so we need to generate an approximation 

Here is a quick and dirty example using one of the `navis` example neurons:

```python
>>> import navis
>>> import skeletor as sk
>>> mesh = sk.pre.fix_mesh(navis.example_neurons(1, kind='mesh').trimesh, remove_disconnected=20)
>>> # New method moving exactly 50 units at each step
>>> s = sk.skeletonize.by_wavefront_exact(mesh, step_size=50)
```

![wavefront_example](https://github.com/user-attachments/assets/75130c60-73ac-47ba-b8a3-5227698b09d1)


Arrows highlight areas where the exact method (yellow) does better than the original (red) method.

TO-DOs:
- [x] improve performance 
- [ ] add mapping between mesh vertices and skeleton nodes
- [x] add documentation
- [x] add tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d576cedf765a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.