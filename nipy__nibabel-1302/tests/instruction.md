# Issue

**Title:** ENH: Improve text for dicomwrapper errors in shape calculation

## Description

To make  more informative.

In the particular case at hand of [http://github.com/neurolabusc/dcm_qa_fmap](https://github.com/neurolabusc/dcm_qa_fmap)  IM_0027_fMAP.dcm we get 

```
nibabel.nicom.dicomwrappers.WrapperError: Calculated # of frames (128=4*32) of shape (64, 64, 32, 2, 2) does not match NumberOfFrames 64.
```

and my wild uneducated guess is that we need to filter out few more of those entries from frame_indices where we have 

```
> p dim_seq
[(0020, 9057), (2005, 106e), (2005, 1011)]
```

where only the first one "known" to pydicom's dictionary, and the other two something are likely something to filter out...
@neurolabusc -- what do you remember about that  `IM_0027_fMAP.dcm` or may be these particular DICOM tags?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a35e2aca27b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.