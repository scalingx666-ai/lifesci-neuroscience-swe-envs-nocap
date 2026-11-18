# Issue

**Title:** ENH warn non-perceptually-uniform 2D colormap

## Description

Add a warning for non-perceptually uniform 2D colormaps (first row in the plot) that have a clear perceptually uniform equivalent (second row in the plot). 
![image](https://user-images.githubusercontent.com/11065596/192605445-93a193c7-2201-45d7-b7a9-ed0a132df629.png)



<details>

```py
import os
import cortex
cmapdir = cortex.options.config.get("webgl", "colormaps")

#######################
# plot all 2D colormaps
cmap_list = sorted(os.listdir(cmapdir))
fig, axes = plt.subplots(4, 8, figsize=(18, 10))
axes = axes.ravel()
for ax in axes:
    ax.set_axis_off()
ii = 0
for cmap_file in cmap_list:
    cmap_img = plt.imread(os.path.join(cmapdir, cmap_file))
    if 1 not in cmap_img.shape:
        axes[ii].imshow(cmap_img)
        axes[ii].set_title(cmap_file)
        ii += 1

fig.tight_layout()
plt.show()

######################################################################
# plot 2D colormaps with a corresponding perceptually uniform colormap
mapping = {
    "BuOr_2D":"PU_BuOr_covar",
    "BuWtRd_alpha":"RdBu_r_alpha",
    "RdBu_covar": "PU_RdBu_covar",
    "RdBu_covar2":"PU_BuOr_covar",
    "RdBu_covar_alpha":"PU_RdBu_covar_alpha",
    "RdGn_covar":"PU_RdGn_covar",
    "hot_alpha":"fire_alpha",
}
fig, axes = plt.subplots(2, 8, figsize=(18, 5))
for ax in axes.ravel():
    ax.set_axis_off()
for ii, (key, val) in enumerate(mapping.items()):
    cmap_img = plt.imread(os.path.join(cmapdir, key + ".png"))
    axes[0, ii].imshow(cmap_img)
    axes[0, ii].set_title(key)
    cmap_img = plt.imread(os.path.join(cmapdir, val + ".png"))
    axes[1, ii].imshow(cmap_img)
    axes[1, ii].set_title(val)
plt.show()

```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2df97758d558`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.