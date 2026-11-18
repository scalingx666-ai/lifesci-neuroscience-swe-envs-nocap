# Issue

**Title:** Add custom_aspect parameter to plot_point_brain.

## Description

The function plot_point_brain() sets the limits of the xyz axes with the following lines of code:

`        ax.set(xlim=0.57 * np.array(ax.get_xlim()),
               ylim=0.57 * np.array(ax.get_ylim()),
               zlim=0.60 * np.array(ax.get_zlim()))`

It also zscores the coordinates beforehand.

This might be problematic since these limits, being hard-coded, can lead to various bugs. For instance, if we use the coordinates of the Lausanne 1000 parcellation, some parcels are cropped out:

![image](https://user-images.githubusercontent.com/46877241/122461313-2bf2df00-cf81-11eb-8673-e6ef42c2a619.png)

To solve this particular bug, I modified those lines to 

`                ax.set(xlim=0.665 * np.array(ax.get_xlim()),
                       ylim=0.665 * np.array(ax.get_ylim()),
                       zlim=0.70 * np.array(ax.get_zlim()))`.

We now get this when we try to plot the Lausanne 1000 parcellation:

![image](https://user-images.githubusercontent.com/46877241/122461541-783e1f00-cf81-11eb-964a-75f940b1c635.png).

The parcels are no longer cropped out.

 Also, I personally enjoy visualizing my data such that the axes are automatically scaled to have "equal" aspect ratios, so I added a custom_aspect parameter to the function that can be set to False if the user wants. If this parameter is set to False, then the axes will be automatically scaled, which gives us:

![image](https://user-images.githubusercontent.com/46877241/122461872-e5ea4b00-cf81-11eb-8a39-3d70bd79b9ce.png).

This comes with the caveat that there is more space between the differerent views, and now the 3 brains are not perfectly aligned on top of one another. Also, the sagittal view is now much more elongated, which might be dissapointing if the user wants to plot a "toy" version of the brain that looks nice. So for this reason, this custom_aspect parameter is set to True by default (which gives us what we had before).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46fdb31ef8c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.