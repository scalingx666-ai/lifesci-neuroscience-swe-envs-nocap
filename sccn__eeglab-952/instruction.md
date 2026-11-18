# Issue

**Title:** pop_topoplot: fix ERP map channel alignment when channels lack locations

## Description

`pop_topoplot` passed only located-channel values alongside the full `chanlocs`, so datasets with interspersed no-location channels (e.g. EOG) plotted ERP data on the wrong electrodes. This builds `SIGTMPAVG` as a full `nbchan`-row array so each channel's value maps to its correct location.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `420769355b4e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.