# Issue

**Title:** ENH:  Expose forward/inverse cumulative velocity fields.

## Description

```bash
input=test.nii.gz
outputPrefix=thickness

# ${input} is the segmentation
# ${outputPrefix}Warped.nii.gz is the tiled 2-D segmentation images warped according to the integration point velocity fields

KellyKapowski -d 2 \
              -s "[${input},1,2]" \
              -o "[${outputPrefix}.nii.gz,${outputPrefix}]" \
              -v 1

ConvertImage 2 ${outputPrefix}InverseVelocityField.nii.gz ${outputPrefix}InverseVelocityField 11

# Go over integration points
for i in {1..9}; 
  do 
    ExtractSliceFromImage 3 ${outputPrefix}InverseVelocityFieldxvec.nii.gz ${outputPrefix}InverseFieldxvec.nii.gz 2 $i
    ExtractSliceFromImage 3 ${outputPrefix}InverseVelocityFieldyvec.nii.gz ${outputPrefix}InverseFieldyvec.nii.gz 2 $i
    ConvertImage 2 ${outputPrefix}InverseField ${outputPrefix}InverseField.nii.gz 9
    # CreateWarpedGridImage 2 ${outputPrefix}InverseField.nii.gz ${outputPrefix}WarpedGrid${i}.nii.gz
    antsApplyTransforms -d 2 -i ${input} \
                             -r ${input} \
                             -o testWarped${i}.nii.gz \
                             -n NearestNeighbor \
                             -t ${outputPrefix}InverseField.nii.gz  
  done

TileImages 3 testWarped.nii.gz 1x1x0 testWarped?.nii.gz
rm -f ${outputPrefix}InverseField*.nii.gz
rm -f testWarped?.nii.gz
rm -f ${outputPrefix}InverseVelocityField?vec.nii.gz
```


[test.nii.gz](https://github.com/ANTsX/ANTs/files/13527967/test.nii.gz)
[testWarped.nii.gz](https://github.com/ANTsX/ANTs/files/13527968/testWarped.nii.gz)
[thickness.nii.gz](https://github.com/ANTsX/ANTs/files/13527969/thickness.nii.gz)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1dee145cda1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.