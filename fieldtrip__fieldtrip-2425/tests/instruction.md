# Issue

**Title:** speed up user experience in ft_defaults / multiple calls to ft_hastoolbox

## Description

The matlab install at DCCN is getting bigger and bigger, which leads to a significant slowdown of ft_defaults. Each call to ft_hastoolbox executes a call to addpath, the execution time of which becomes significant when there are a lot of folders on the path already (e.g. DCCN's standard install of matlab2023b has ~1574 folders, matlab2018b has 785). This is of course a minor potential improvement because ft_defaults is executed typically only once in a MATLAB session, but for me the execution can sometimes take about 30 seconds or so. (another substantial slowdown is the 'startup' of the trackusage - due to it seems a matlab version dependent slowdown of urlread/webread, but that can be optionally switched off).

The main intended change here is that ft_hastoolbox now can also support a cell-array of toolboxes as input

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `164f177e2996`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.