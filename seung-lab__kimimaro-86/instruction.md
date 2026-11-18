# Issue

**Title:** feat: respect connected components for invalidation + full voxel graph support

## Description

This PR switches the invalidation method from `roll_invalidation_cube` to `roll_invalidation_ball_inside_component`, this has several consequences.

`roll_invalidation_ball_inside_component` is...
- slower
- understands voxel connectivity graph input
- has a spherical area of effect rather than cuboid
- respects the current path's connected component

In all, it represents a step up in skeleton quality at the moderate expense of speed.

The other change is we now use `cc3d.color_connectivity_graph` when a voxel graph is provided rather than `cc3d.connected_components`.

In all, this provides full support for connectivity graph based skeletonization, which enables the accurate processing of volumes containing a "self-touch" (autapse).

Example results
===============

An autapse visualized as a mesh:

![image (26)](https://github.com/seung-lab/kimimaro/assets/2517065/a6d92e62-2b89-4027-9687-9ec9b4094d35)

Using PyChunkGraph information to create a voxel connectivity graph, processed with this PR:

![image (25)](https://github.com/seung-lab/kimimaro/assets/2517065/1f9192dd-856f-470e-bc71-af586ac952c7)

Using the old method:

<img width="543" alt="Screenshot 2024-05-22 at 2 23 23 PM" src="https://github.com/seung-lab/kimimaro/assets/2517065/808f4817-a407-4ae4-9ba8-f97e26a52a9b">


Performance characterization of a 512<sup>3</sup> task (black) this PR (blue) old method without voxel graph:
![image (24)](https://github.com/seung-lab/kimimaro/assets/2517065/a2b51376-5f3e-42a3-825c-a603cf01b042)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd3b1318f297`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.