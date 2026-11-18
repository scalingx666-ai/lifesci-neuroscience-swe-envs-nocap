# Issue

**Title:** Allow Dredge AP to use online motion resolution method

## Description

The motion correction algorithms in SpikeInterface have two steps. You first compute many histograms-in-depth (using e.g. peak detection or LFP) over time. Second, you compare the histograms at different times to extract a time vector.

In the current implementation, if you use peak detection the comparison part of the algorithm compares ALL histograms against all others. This is fine if you have a standard recording, but fills up RAM quickly if you get towards one day long recordings. If you use LFP there is an "online" method to compare the histograms. This only compares histograms which are nearby in time, meaning that you don't need to load them all into memory. Hence, this can be used for very long recordings.

This PR refactors the "all at once" and "online" methods to extract motion vectors from histograms, allowing either method to be used regardless of histogram-construction method. Most of the pain is in how parameters are dealt with - they were packaged a bit differently for the two algorithms. We attempt to unify the arguments in the two methods as much as possible, and abstract some language.

Docs, tests, etc incoming.

I spent a while understanding the parameters and all the kwarg dicts. Here's a summary:

Parameters
========

User can give `dredge_ap` and `dredge_online_lpf` the following dicts:

thomas_kw: passed to `thomas_solve`
xcorr_kw: passed to `xcorr_windows`

Inside the functions, we set the following kwarg dicts:

full_xcorr_kw
 - rigid
 - bin_um
 - max_disp_um
 - progress_bar
 - device

weights_kw (passed to `weight_correlation_matrix`in AP, just used to get `mincorr` in LFP)
 - mincorr
 - time_horizon_s
 - do_window_weights
 - weights_threshold_low
 - weights_threshold_high

threshold_kw (passed to `threshold_correlation_matrix`). We set:
 - mincorr_percentile_nneighbs
 - in_place
 - soft
 - time_horizon_s 
 - bin_s

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15cde2779640`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.