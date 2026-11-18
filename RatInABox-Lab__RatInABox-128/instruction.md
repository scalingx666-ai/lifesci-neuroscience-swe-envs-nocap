# Issue

**Title:** Progress bar for creating animations

## Description

Since creating animations can take a long time (tens of minutes), it can be helpful to know how long it's going to take/whether the animation is almost complete. 

So I added a keyword argument (`progress_bar`) that adds a progress bar when creating animations with ratinabox. I only added it to the modules (not to the notebooks) that call `matplotlib.animation.FuncAnimation`: `Neurons.animate_rate_timeseries()` and `Agent.animate_trajectory()`. 

I set the default to `False` to avoid changing existing behaviour. The progress bar is created through `tqdm` which is imported only if `progress_bar` is True. Here is an example from a notebook. It shows what frame you're at, and estimates the total time too.

![progress_bar](https://github.com/user-attachments/assets/9ef6211b-7473-41f3-9aee-c3c43f9c7efb)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f111b17baab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.