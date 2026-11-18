# Issue

**Title:** FIX #2326 - fixed time range selection for select_topoplotER in ft_multiplotER

## Description

The problem reported by @RaoXie in #2326 was due to the time range selection assuming that the x-axis of the figure corresponded to the time scale of the data. That is not the case, as the figure is still constructed by plotting many channels on top of each other according to the butterfly layout.  Whenever a layout is involved ft_plot_vector makes use of local pseudo-axes.
 
Furthermore
- renamed viewmode layout into topographic
- do not recursively store the topographic layout in the butterfly layout
- added check and informative error for labelcharN
- make chanindx selection in pointsymbol, pointsize, pointcolor

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `777d5734c536`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.