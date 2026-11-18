# Issue

**Title:** ENH - attempt to harmonise the handling of plotting masks for topos

## Description

As discussed already a bit with @robertoostenveld : 

At high level, ft_prepare_layout allows for various ways of creating an outline/mask for 2D interpolated plotting.

At lower level, ft_plot_topo contained its own (semi-)ad-hoc way of creating a mask. The reason for having that functionality at the lower level as well is probably inspired by the fact that ft_plot_topo can be called with only x/y/val arguments, so without an externally supplied outline/mask. 

To prevent re-inventing the wheel, I moved the functionality from ft_prepare_layout (for the outline creation) to a separate private function, so that it can also be used from within ft_plot_topo. 

What needs to be done still is to check whether the documentation can be simplified (e.g. the fieldline OPM docs, where ft_prepare_layout is called after removing the mask from the layout stored on disk), and whether we need to harmonise the high-level default option names (e.g. in ft_topoplotER there's cfg.interplimits 'head', which is translated into 'mask' lower in the code).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c37c93e4aede`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.