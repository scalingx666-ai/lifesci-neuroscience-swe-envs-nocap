# Issue

**Title:** Deepcopy of metric params

## Description

Fixes full tests failing: https://github.com/SpikeInterface/spikeinterface/actions/runs/29258168630/job/86843964751

Basically, curation tests were mutating `BaseMetric.metric_params`, since we were not deep copying them. The fix is just to add a `deepcopy`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69fa6a62daf0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.