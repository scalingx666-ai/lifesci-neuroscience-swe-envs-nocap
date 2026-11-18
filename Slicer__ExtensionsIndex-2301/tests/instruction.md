# Issue

**Title:** OpenMAPT1Auto extension

## Description

## Extension Summary

OpenMAPT1Auto provides automated brain MRI parcellation into 280 anatomical 
regions using the OpenMAP-T1 deep learning model developed by Johns Hopkins 
University.

**Repository:** https://github.com/niyaziacer/OpenMAPT1Auto

## Key Features

- Automated T1-weighted MRI segmentation
- 280 brain anatomical regions parcellation
- User-friendly 3D Slicer interface
- Fast deep learning-based processing
- Volume calculations and CSV/Excel export
- 3D visualization of results

## License & Compliance

- **Extension code:** MIT License
- **OpenMAP-T1 model:** JHU Research Software License (Non-Commercial, No Redistribution)
- **Model files:** NOT included in repository
- **User workflow:** Download models separately from official OpenMAP-T1 repository
- **Attribution:** Full credit to Johns Hopkins University and original authors

## Documentation

- **README:** https://github.com/niyaziacer/OpenMAPT1Auto/blob/main/README.md
- **Screenshots:** Provided in repository
- **License:** https://github.com/niyaziacer/OpenMAPT1Auto/blob/main/LICENSE.txt
- **Model download instructions:** Clear guidance for users

## Extension Metadata

- **Status:** Beta
- **Category:** Segmentation
- **Contributors:** Niyazi Acer (Sanko University)
- **Homepage:** https://github.com/niyaziacer/OpenMAPT1Auto
- **Slicer version:** 5.0+

## Testing Checklist

- [x] Builds and runs on 3D Slicer 5.0+
- [x] Dependencies verified (PyTorch, MONAI, nibabel, SimpleITK)
- [x] No large files in repository (models hosted separately)
- [x] Comprehensive README with installation instructions
- [x] LICENSE file included with dual-license explanation
- [x] Screenshots provided
- [x] Proper attribution to OpenMAP-T1 original work
- [x] `.s4ext` metadata complete and validated

## Additional Notes

This extension integrates OpenMAP-T1 into 3D Slicer while fully respecting 
the JHU license restrictions. Users are directed to download model files 
from the official OpenMAP-T1 repository, ensuring license compliance and 
proper usage tracking.

The extension provides significant value to the 3D Slicer community by 
making state-of-the-art brain parcellation accessible through a familiar 
interface.

Please review and let me know if any changes are needed. Thank you!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf7c741fb0d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.