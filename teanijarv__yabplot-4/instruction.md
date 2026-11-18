# Issue

**Title:** Added .tsf based coloring functionality to plot_tracts() function.

## Description

There is a very specific functionality in MRtrix3 that colors streamlines based on any underlying map. This is very useful if one wants to visualize, e.g., FA values along a tract. It's a bit of a niche requirement, so far, I think only mrview implements this via the "color by file" option in the tractography menu, however that is not easily script-able. They call these "track scalar files" and they encode in a binary format one scalar per point per streamline. 

The way to derive this files is by the following command:

`tcksample track.tck map.nii.gz stats.tsf`

I added a function to read these files: `read_tsf()` and added functionality to the `plotting.plot_tracts()` and `utils.prep_data()` to handle the input. It should be in a way, such that it integrates with the way how data was handled  before. It keeps the variability of the data structures, however checks if the data type is a string, and if so, interprets it as .tsf path. I think this maintains all previous functionality, but I certainly have not checked all the possible combinations. 
From there on, it works the same as the orientation_coloring, i.e. one scalar per point which gets translated into Nx3 array for rgb.

Results may look like this (FA on TractSeg derived CC and CST):
 
<img width="1164" height="778" alt="Screenshot 2026-03-20 at 16 28 38" src="https://github.com/user-attachments/assets/dc248339-946f-48bd-8b4f-fc0ea1373dc6" />
<img width="1041" height="780" alt="Screenshot 2026-03-20 at 16 48 58" src="https://github.com/user-attachments/assets/2ef291f3-a7b1-420b-a3dc-21ceb6c1c1e4" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f25028a8e395`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.