# Issue

**Title:** Add a SortingAnalyzer fixture to the cross-version serialization tests

## Description

This is a peel-off of Alessio's serialization fixture from #4260 to simplify it. The files are identical to their versions there, so merging main into that branch produces no conflicts for them.

I am doing this first because #4260 changes the on-disk format of the `SortingAnalyzer`, and I want a test on main that analyzers saved by released versions still load before that lands. The fixture saves an analyzer with every extension in each old release and checks that all of them reload with their data.

It already caught a bug on main: `spiketrain_metrics` sets `need_backward_compatibility_on_load = True` without implementing the handler, so any analyzer with that extension fails to load, even one saved by main. I set the flag to `False`, as in #4260.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36dc59320bd5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.