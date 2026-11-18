# Issue

**Title:** Speed up atlas generation by using cropped regions

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Mesh generation and 4D mask writing build a full-volume mask for every structure. On large atlases with hundreds of structures, this makes packaging slow and memory-heavy, even though most regions only take up a small part of the volume.

**What does this PR do?**

Each structure is now processed only inside the bounding box of its voxels and its descendants' voxels. The output is identical.

- New helper `_label_bounding_boxes` (`mesh_utils.py`) finds the bounding box of every label in one pass. It reads the volume in slabs and uses `scipy.ndimage.find_objects`, so it never allocates a full-size index array.
- **Meshes**: `construct_meshes_from_annotation` passes each region a bounding box padded by `closing_n_iters + 1`. That padding makes `binary_fill_holes`, `binary_closing` and `.cap()` behave exactly as they do on the full volume. `_create_region_mesh` meshes only the crop, and in parallel mode it reads only the zarr chunks that overlap the box. `extract_mesh_from_mask` takes an `origin` so the vertices stay in full-volume coordinates. `origin` is ignored when `use_marching_cubes=True`.
- **Masks**: `_compute_4d_masks_for_scale` computes and writes each structure's mask only inside its bounding box. The rest of the scratch zarr stays at `fill_value=0`, so empty chunks are never written.

## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

New tests have been added.

## Is this a breaking change?

No. Mesh and mask outputs are identical to before (see tests). The new `origin` (`extract_mesh_from_mask`) and `bbox` (`_create_region_mesh`) arguments are optional, so existing direct calls are unaffected.

## Does this PR require an update to the documentation?

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `962eca9b645b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.