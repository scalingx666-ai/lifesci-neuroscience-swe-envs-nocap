# Issue

**Title:** [bugfix] int16 and int32 max values not being considered correctly while converting MRI to NifTi-1

## Description

DATA: https://drive.google.com/file/d/1aAl5ZyGC6qZAxLSVXDBFJSLM9BKOv6uS/view?usp=sharing

Steps:
1. Import MRI
2. Import CT > **CT2MRI** > Reslice **(Yes)** > Clean CT **(Yes)**

Error:
```BST> Plugin ct2mrireg already loaded: C:\Users\chinm\.brainstorm\plugins\ct2mrireg
BDP Version: 23a (build #2307), released 2023-07-17 
BST> System call: bse -i "C:\Users\chinm\.brainstorm\tmp\ct2mrireg_240508_124638\ct2mri_ref.nii" --auto -o "C:\Users\chinm\.brainstorm\tmp\ct2mrireg_240508_124638\skull_stripped_mri.nii.gz" --trim --mask "C:\Users\chinm\.brainstorm\tmp\ct2mrireg_240508_124638\bse_smooth_brain.mask.nii.gz" --hires "C:\Users\chinm\.brainstorm\tmp\ct2mrireg_240508_124638\bse_detailled_brain.mask.nii.gz" --cortex "C:\Users\chinm\.brainstorm\tmp\ct2mrireg_240508_124638\bse_cortex_file.nii.gz"
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
1. cost(3,25,0.64,1)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
2. cost(3,25,0.64,1)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
3. cost(3,25,0.64,1)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
4. cost(3,25,0.64,1)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
1. cost(3,25,0.64,2)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
2. cost(3,25,0.64,2)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
3. cost(3,25,0.64,2)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
error: datatype (sint32) is not currently supported for BSE. 
4. cost(3,25,0.64,2)=1.00006e+06 
lowest cost(3,25,0.64,2)=1.00006e+06 
error: datatype (sint32) is not currently supported for BSE. 

***************************************************************************
** Error: BrainSuite failed at step BSE.
** Check the Matlab command window for more information.
***************************************************************************
```

Debugged with @ajoshiusc and found that even though the max value was 32767 in the MRI, it considered it as int32 and not int16.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4317b580232`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.