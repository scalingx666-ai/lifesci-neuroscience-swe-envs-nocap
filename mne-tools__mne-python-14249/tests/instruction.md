# Issue

**Title:** Speed up evoked time plotting

## Description

Closes 

@wmvanvliet I generalized our blit code. Looks like it's actually pretty clean, steps:

1. Generalize our `brain` blit code to a more general version `_BlitManager`
2. Use that version in 3D plotting
3. Use that version in `evoked.plot` and `evoked.plot_topo`
4. Use that version in our animate_topomap code
5. Speed up animate_topomap by actually blitting properly (working around a matplotilb issue where the figure would silently invalidate and draw nothing if you tried to use the correct blit path)

Minor changes to evoked.plot and evoked.topo are that the time `axvline` will stay on top now, but I think that's reasonable (and expected).

(5) was a pain to discover -- turns out to be caused by the modification of the contours, which removes and re-adds the set to the axes, which invalidates the draw, causing a full redraw (with nothing left to draw, so you get a blank plot). The workaround I came up with is to add a dummy no-op `ax` class pass to the `contour` call, and then pull the contours from it. I'm going to work on upstreaming a warning about this and a less-hacky way to get the contours... but it might be a bit to land etc. In the meantime I think the no-op class is workable, and has a big performance boost.

(5) speeds up `report.add_evoked` from about 8s to 5s by dropping the timepoint code from over 3s to under 1s.

I then also sped up how images are embedded in reports to cut down another second off that 5s `add_evokeds`.

I used Claude Opus 5 to investigate (iterating / reviewing multiple versions).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60990d618ad1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.