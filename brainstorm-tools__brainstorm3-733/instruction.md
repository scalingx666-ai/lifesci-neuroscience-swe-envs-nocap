# Issue

**Title:** [MEM] Reduce file size when using wavelet-MEM

## Description

Hi, 

This implements the idea I started here: https://neuroimage.usc.edu/forums/t/stange-bug-when-saving-mem-results/45901/7 when using wMEM. The main idea is to attempt to reduce the file size. this is mostly important for nirs as we are about to use wMEM for long-duration data but it is also nice for EEG/MEG. 


The principle is the following: for wMEM, the data is first transformed using a time-frequency representation (nSensor x nBox), then each time-frequency box is localized, and finally, the time-course is recreated by inverting the time-frequency transformation. 

The last step can be seen here: 
This can be seen here: https://github.com/Edouard2laire/best-brainstorm/blob/wMEM-nirs/best/wmem/solver/be_wmem_solver.m#L202-L204

```matlab

    inv_proj    =   be_wavelet_inverse( wav, OPTIONS );
    inv_proj    =   inv_proj(:,obj.info_extension.start:obj.info_extension.end);
    obj.ImageGridAmp =  obj.ImageGridAmp * inv_proj;

```

The objective of this PR is instead of saving the result of the multiplication obj.ImageGridAmp (nVertex x nBox) * inv_proj (nBox x nTimes) to save each matrix separately and compute the multiplication on loading. 


```matlab

% Results (full temporal sequence)
Results = struct(...
    'ImageGridAmp',     obj.ImageGridAmp, ...
    'ImagingPostKernel',inv_proj, ...
    'ImagingKernel',    [], ...
    'MEMoptions',       OPTIONS, ...
    'MEMdata',          obj);

```

On the EEG data for the epilepsy tutorial, it means that we go from a matrix ImageGridAmp: [15002x206 double] 
to ImageGridAmp:      [15002x29 double] and ImagingPostKernel: [29x206 double] 


so that the size of the file in brainstorm db goes down from 120356918 Bytes to 77919214 Bytes ( 35% reduction). 
Let me know if this change would be ok for you to integrate in Brainstorm. 


Note; I was not sure about the name ImagingPostKernel, so if you have a better idea :) 

Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e08897975c28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.