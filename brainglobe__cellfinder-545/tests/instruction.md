# Issue

**Title:** Add tiled thresholds to 2d filtering for determining foreground pixels

## Description

## Description

This PR depends on  Also, the figures below were generated using 

This adds a tiled threshold to the 2d filtering step that decides whether a pixel is foreground or background. Currently it computes a per-plane mean and then sets pixels above `threshold * std + mean` as foreground. 

The problem, as seen below, is that cfos data can be quite non-uniform in lighting at a acquisition tile level or lightsheet side in addition to having clumps of cells. So if you set a low threshold to get dark cells, bright areas will look like one giant blob as most of the area will be above the threshold. Doing multiple thresholds and running multiple times will result in the hard problem of finding duplicates.

This PR tiles the plane and computes a mean/std for each tile. Then, a pixel is marked bright when it's bigger than `max(plane_threshold * plane_std + plane_mean, tile_threshold * tile_std + tile_mean)`. The trick then is to set a low threshold to get the dark cells in dark areas. But, in brighter areas `tile_mean` will be larger so the effective threshold will be larger. As you can see from the images below, it's pretty effective for compensating for the variable brightness in different tiles.

I found good results for my test samples using a plane threshold of `.5`, a tile threshold of `1`, and a tile size of `5`, which at a soma of `8` comes out to `40` pixels.

What about using just the tiled threshold? The problem is with dark areas whoose local `mean` is very low and so the threshold is low. So we still need the global threshold as a way to exclude pixels that are generaly dark or outside the brain. This is something that the bright tiles algorithm in main is supposed to address, I think, but it's not working for cfos. It marks everything as in-brain, except the very edges of the 3d volume. I would actually love a way to disable the bright tiles algorithm for that reason - it should be very easy to do with a simple parameter, if that is acceptable to add to main/napari?

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Look at the following images (open them to see them full size). In the input data, there's quite obvious acquisition tiling and tiles that are brighter than others due to lightsheet shenanigans. Plus, there are some areas that are just naturally a lot brighter because of clumps of cells or other structures. You can also see the output of the first step of 2d filtering (Gaussian and Laplacian filtering).

| Input | Laplace/Gauss filtered |
| -------- | ------- |
| ![Input](https://github.com/user-attachments/assets/eb512554-f4e2-478b-b9ad-3f5d6c45e597) | ![Laplace/Gauss filtered](https://github.com/user-attachments/assets/aa107885-6dbf-4354-9553-af9da0850b4d) |

Now lets look at the output of the 2d filter and 3d filters and splitting, where they marked bright and non-bright pixels/voxels. The per-plane threshold was set at `0.5`, the per-plane per-tile threshold at `1`, and the tile size, when tiled, was set at `5`, which at `5 x soma size` of `8` is `40` pixels.

Also, the cluster splitting column, the brightest pixels are clusters considered too big to split, everything else are cells.

When using just the global per-plane threshold (row 1), we have to set it low to get the less dark cells. But this results in getting many more artifacts and random stuff marked as bright/cells. Using a tiled threshold (row 2), which uses the max of of the global and tile threshold to decide whether a pixel is bright, we end up getting similar values of cells across tiles that have different brightness (e.g. right vs left OB). It doesn't completely eliminate the issue of how to handle clumps of bright cells, but it mostly fixes it to within acceptable levels.

|  | 2d filter output | 3d filter output | Cluster splitting output |
| --- | --- | --- | --- |
| Per-plane threshold | ![2d_filtered untiled](https://github.com/user-attachments/assets/6a871032-4281-4c90-b5a0-882bada9a92a) | ![3d_filtered untiled](https://github.com/user-attachments/assets/c74599bf-ecf2-450d-a8db-9ea93d8095c9) | ![split untiled](https://github.com/user-attachments/assets/3018a64e-b962-4bcf-8d9c-e6a803bccee9) |
| Per-plane, per-tile threshold | ![2d_filtered tiled](https://github.com/user-attachments/assets/65b53679-cf8a-4f02-a263-76d7ecfd0632) | ![3d_filtered tiled](https://github.com/user-attachments/assets/14897cd5-8ea4-467d-a621-632ffec17d8c) | ![split tiled](https://github.com/user-attachments/assets/8add8e65-1f44-4ae7-ab15-201a5c2de2a8) |

Now lets look a little closer at 3 different areas. A very bright clump of cells, a neutral area, and dark area.

Bright area, there's clear benefit to tiling threshold:

|  | Input data | 2d filter output | 3d filter output |
| --- | --- | --- | --- |
| Per-plane threshold | ![OB_raw](https://github.com/user-attachments/assets/d90cae51-f31c-4d1a-8424-e4f993654809) | ![OB_filtered2d_0](https://github.com/user-attachments/assets/c0c8fd21-86a4-489b-9d38-491e4fd6658e) | ![OB_filtered3d_0](https://github.com/user-attachments/assets/dfcdca5c-d527-4884-b668-71de3d9d4914) |
| Per-plane, per-tile threshold | ![OB_raw](https://github.com/user-attachments/assets/d90cae51-f31c-4d1a-8424-e4f993654809) | ![OB_filtered2d_5](https://github.com/user-attachments/assets/18024873-6921-482d-8494-cec01e4ccb8a) | ![OB_filtered3d_5](https://github.com/user-attachments/assets/f7b05b34-649e-4f3a-8278-68a3c2a628a7) |

Neutral area, maybe slight benefit to tiling:

|  | Input data | 2d filter output | 3d filter output |
| --- | --- | --- | --- |
| Per-plane threshold | ![good_raw](https://github.com/user-attachments/assets/535c8de0-439c-421f-b0bc-e8499cea2768) | ![good_filtered2d_0](https://github.com/user-attachments/assets/e3990661-396f-433c-9429-712818911031) | ![good_filtered3d_0](https://github.com/user-attachments/assets/bdd22988-c9d5-4374-8b5a-e44a9bc2c4a2) |
| Per-plane, per-tile threshold | ![good_raw](https://github.com/user-attachments/assets/535c8de0-439c-421f-b0bc-e8499cea2768) | ![good_filtered2d_5](https://github.com/user-attachments/assets/67666b46-16d8-405b-a20b-bba77ad04d14) | ![good_filtered3d_5](https://github.com/user-attachments/assets/c7e952a9-613e-45e1-8a47-65694f7fce3a) |

Dark area, tiling is very similar to non-tiling:

|  | Input data | 2d filter output | 3d filter output |
| --- | --- | --- | --- |
| Per-plane threshold | ![dark_raw](https://github.com/user-attachments/assets/2be4be18-f3bf-498b-b30e-492cc5b99655) | ![dark_filtered2d_0](https://github.com/user-attachments/assets/a4fe6368-7a1f-4300-a0d2-dbb981e63403) | ![dark_filtered3d_0](https://github.com/user-attachments/assets/6120d603-596e-46f3-9da7-3bfc82030f62) |
| Per-plane, per-tile threshold | ![dark_raw](https://github.com/user-attachments/assets/2be4be18-f3bf-498b-b30e-492cc5b99655) | ![dark_filtered2d_5](https://github.com/user-attachments/assets/c3e359cd-6baf-4a96-8aaf-23a7814798f6) | ![dark_filtered3d_5](https://github.com/user-attachments/assets/2fdb9d3c-d3c8-46c0-ad57-97c32cfb2d8d) |

**What does this PR do?**

As explained above, this adds a tiled threshold to the 2d filtering step that decides whether a pixel is foreground or background. It also exposes the parameters in the main functions and napari.

## References



## How has this PR been tested?

I added tests and I tested it with my data.

## Is this a breaking change?

No. All the changes are backward compatible because by default `tiled_thresh_tile_size` is `0` so no threshold tiling is done.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4224d72a38e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.