# Issue

**Title:** optional post-processing step for duplicate spike removal

## Description

I added a function "remove_ks2_duplicate_spikes" which takes in a "rez" structure during post-processing and removes spikes that are likely double-counted, based on their spatiotemporal overlap with other spikes. Specifically, it two spikes occur within less than X ms and belong to templates with peaks less than Y um apart, the spike belonging to the smaller-amplitude template is removed. X is 0.5ms by default, and Y is 100 um by default. We have implemented this in our kilosort master script for some time and I thought it may be useful for others. Right now, it's commented out so as not to disrupt the default behavior but could be uncommented to enable it (or in future enabled programmatically with a flag of some kind).

One other minor change in this PR is the addition of a 1D drift map to the figure illustrating drift in the recording. I find it a useful visual tool in addition to the distance matrices. It plots batch position on the 1D embedding performed already by ks2.
![untitled](https://user-images.githubusercontent.com/7927884/93486628-6b957900-f8d2-11ea-853a-9dd84c7e53ef.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdf9366bc73b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.