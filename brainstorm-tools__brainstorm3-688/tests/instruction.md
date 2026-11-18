# Issue

**Title:** view_channel_3d: take an already created figure as input

## Description

This PR allows the following code to work: 

```matlab

hFig  = bst_figures('GetFigureWithSurface', SurfaceFile);
hFig  = view_surface_data(SurfaceFile, OverlayFile, [], hFig, 1);
hFig  = view_surface(ScalpFile, 0, [], hFig, 1);
hFig  = view_channels_3d(channelFile, 'NIRS-BRS', 'scalp', 0, 1,hFig);

```

This code produce the following image and solve my problem from here: https://neuroimage.usc.edu/forums/t/visualizing-sensors-on-top-of-cortical-activity/44950/2

<img width="672" alt="image" src="https://github.com/brainstorm-tools/brainstorm3/assets/24530402/f24c84b2-09b4-4d51-bf41-986e3fc07892">


hs: is there a better way to create an empty figure than : hFig bst_figures('GetFigureWithSurface', SurfaceFile); ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45f87ef6c271`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.