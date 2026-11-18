# Issue

**Title:** bugfix when display scout time series with a time series already open

## Description

Hello, 

This fix a bug that has been annoying me for years :) 

To reproduce: 
- open a reconstruction map on the cortex
- Visualize one timecourse from a ROI
- open another map 
- click on the visualize time-course button. (with Files overlay selected) 

The second visualize time-course click results in an error if you don't close the previously opened time course. This PR fixes that and allows adding a new time course in the window without closing it first. 


Here is the error that get fixed: 

```matlab
***************************************************************************
** Error: Line 63:  strcmp
** Inputs must be the same size or either one can be a scalar.
** 
** Call stack:
** >file_compare.m at 63
** >bst_figures.m>CreateFigure at 148
** >bst_figures.m at 59
** >view_timeseries_matrix.m at 152
** >view_scouts.m at 662
** >panel_scout.m>ViewTimeSeries at 3790
** >bst_call.m at 28
** >panel_scout.m>@(h,ev)bst_call(@ViewTimeSeries) at 91
** 
***************************************************************************
```


The only eventual issue with this fix, is that it is opening a new time-course viewer instead of reusing the previous one; but I guess this is better than an error :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91d9d70c1586`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.