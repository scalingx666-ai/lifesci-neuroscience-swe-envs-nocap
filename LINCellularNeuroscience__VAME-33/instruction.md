# Issue

**Title:** Usability enhancements

## Description

Hi VAME team, thanks for the nice work! I finally got around to testing it this weekend, and I ran into some issues and a few enhancements that I found helpful while I went through it (see list below). 

**Issue:** many paths are hard coded for linux such that when a project is created even on a macOS there are some issues (project_path does not end in a / by default when you create a project on mac, such that nearly all functions break. So, I fixed this (although there may be more spots to improve paths...).

 I confirmed this runs PR on MacOS and linux via Colaboratory. In `Python 3.7` with `PyTorch 1.8.0`. Note, I only tested default _kmeans_ cases (so path issues likely lurk elsewhere).

**Enhancements:**

- added the conversion from DeepLabCut csv to numpy as a function. Users can now run: 
```python
vame.csv_to_numpy(data, outputpath)
```
data = path to csv; output = path you want it to go. 

- allow more than just mp4 videos in `vame.motif_videos` (users now pass the videoType, with default is still your `.mp4`) this also formally  and #19. Use as:
```python
vame.motif_videos(config, model_name='VAME', videoType='.avi',cluster_method="kmeans", n_cluster=[4])
```
- Made the whole package (train, eval, etc) usable on a CPU; although of course a GPU is much faster, sometimes this is helpful for dev, or users who don't have a GPU. If CUDA/GPU is not found, it will print a warning to the users. Also upon import of the package if a GPU is found, it now prints this information once.

- a `.gitignore` file for ease of use ;)
- a `VAME.yaml` file for an easy-to-install one-line call for users (and docs in readme.md)
- added `__inti__` imports for aux fxns, such that one can use `vame.auxiliary.read_config(config)` & `vame.auxiliary.write_config(config, cfg)` and took the liberty to update this to DLC's latest versions here.

I hope this is helpful!

And, if I may take the opportunity, did I miss the code to actually visualize the clusters as shown [here](https://github.com/LINCellularNeuroscience/VAME/blob/master/Images/behavior_structure_crop.gif) ? :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ab929f81bde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.