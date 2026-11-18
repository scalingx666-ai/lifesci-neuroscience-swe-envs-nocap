# Issue

**Title:** Modifications to plot_tutorial0.py

## Description

Includes several minor changes to the example plot_tutorial0.py, including adding a requirements section at the top. There are also minor changes to the order of example steps. 

I've also modified the fetch_timeseries_preprocessing function to return a 2D array with the left and right hemispheres already stacked. I think this would be more consistent with how I would import data for the example.

Also, just a thought, but I would suggest pip installing the load_confounds function instead of adding directly to the code base, as it would be good to continually have updates from the original repo. This could also be included as a submodule...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64c5837e5c96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.