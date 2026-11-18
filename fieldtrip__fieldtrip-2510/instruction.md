# Issue

**Title:** ENH - allow for slower, but more memory efficient appending

## Description

this PR aims at allowing for a less memory greedy append operation. 

Use case: I wanted to call ft_appendtimelock on a varargin with 37 elements, appending across channels (with about 10 channels per element). 

This led to a massive (prohobitive) extra memory usage, because ft_selectdata (under-the-hood) temporarily needs to create N times a  'union' based full-sized data structure (i.e. 37 a data structure with 370 channels (I had a 'rpt_chan_time' dimord with about 6000 rpts)). Ergo: computer said no.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e4c6959de6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.