# Issue

**Title:** Fiber bundle label selection resampling

## Description

Hi @ihnorton, @ljod

I have make some changes to resample the fiber points according to the processing in [FiberBundleToLabelMap](https://github.com/SlicerDMRI/SlicerDMRI/blob/master/Modules/Scripted/FiberBundleToLabelMap/FiberBundleToLabelMap.py#L175-L209). Could you take a look at the updates? Thanks!
I ran some tests on the data from Walid and it removes the fibers that should not be kept. But, now it becomes slower than before, as there are more points to be checked. Do you have any ideas that can improve this? Maybe a higher sample distance? Now I used 0.1 as in FiberBundleToLabelMap.

Regards,
Fan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `248df4bce1ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.