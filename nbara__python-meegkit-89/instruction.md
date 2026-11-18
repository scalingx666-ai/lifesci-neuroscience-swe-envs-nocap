# Issue

**Title:** [ENH] Annotations in dss_line_iter plots and specification of a saving path

## Description

Modified annotations of dss_line_iter plots when show=True:
- added a legend to the mean PSD across trials and sensors plot
- rotated the Residuals plot
- changed title of the Iterations plot to "Aggregated residuals"
- added x and y labels to all plots

In dss_line_iter function:
- removed the 'prefix' parameter
- added a 'dirname' parameter
- added an 'extension' parameter

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a9a82673700`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.