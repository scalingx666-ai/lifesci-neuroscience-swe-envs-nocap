# Issue

**Title:** WIP 0.4.6 Release

## Description

# Changes for new release 

1. Support multiplication from the left (only with lists!)
2. Dramatically speed up `Brain_Data.similarity` and support rank correlation #308 #316 #404
3. Add tests for `Design_Matrix.clean` and prevent use with `Design_Matrix` has duplicate column names
4. Incorporate PR #401 : 

    ```
    # User loads h5 that contains mask so that mask is used instead of the default MNI mask
    
    Brain_Data('brain.h5')
    
    # User loads h5 that contains mask but also sets mask argument.
    # Now mask value takes precedence over whatever mask is in h5 
    # so we issue a warning to the user letting them know on load
    
    Brain_Data('brain.h5', mask='path/to/nifti/mask.nii.gz')
    
    >>> UserWarning(...)
    
    # User loads h5 that does NOT contain a mask and doesnt set the mask
    # argument so the default MNI mask is used, similar to nifti files
    # This is an implicit fallback just like with niftis 
    
    Brain_Data('brain_nomask.h5')
    
    # User loads h5 that does NOT contain mask but also sets mask argument
    # Mask value is used to learn transformation like niftis
    # No need to warn them about anything
    
    Brain_Data('brain_nomask.h5', mask='path/to/nifti/mask.nii.gz')
     ```
5. Fix weird formatting issues for some API docstrings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1ac36eb300c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.