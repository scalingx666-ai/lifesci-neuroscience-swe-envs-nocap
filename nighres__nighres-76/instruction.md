# Issue

**Title:** Wrapped FilterRidgeStructures

## Description

Hey guys,

In the "Spinoza MP2RAGE"-pipeline, as implemented in JIST, there is a layer where the T1 image gets filtered to find ridges, "tubular structures", and the dura. This seems pretty crucial in preventing MGDM/CRUISE from estimating cortex to lie in the dura mater.

Here I wrapped the JistFilterRidgeStructures Java module in Python.

@piloubazin: I can not find the [TubularStructures](https://github.com/piloubazin/cbstools-public/blob/b293cf97c32b238d0ba1eb975adda272cb0c4048/de/mpg/cbs/jist/filter/JistFilterTubularStructures.java), or the [MP2RAGEDuraEstimation](https://github.com/piloubazin/cbstools-public/blob/b293cf97c32b238d0ba1eb975adda272cb0c4048/de/mpg/cbs/jist/brain/JistBrainMp2rageDuraEstimation.java) in the Python cbstools-module. Is there a way to include them in the jcc compilation? Or maybe we can implement this filtering approach using Scipy's ndimage module?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae6e32d40652`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.