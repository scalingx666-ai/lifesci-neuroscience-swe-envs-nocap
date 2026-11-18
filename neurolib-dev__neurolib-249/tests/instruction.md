# Issue

**Title:** Lead field matrix

## Description

**Overview:**
This pull request integrates two main components:

1. **AAL2 Atlas Data Files**: Added Automated Anatomical Labeling 2 (AAL2) atlas parcellation files, specifically `AAL2.nii` and `AAL2.xml`.

2. **Lead-field Matrix Computation Script**: Introduced a utility script `leadfield.py` to facilitate the calculation of the lead-field matrix for the template data "fsaverage" in alignment with the AAL2 atlas and the standard 1020 EEG montage, it serves as necessary functions script to execute the Jupyter notebook from Orabe Mohammad `example-0.8-leadfield-matrix.ipynb` (_neurolib/examples/_).

**File Paths**:

- Two AAL2 Atlas Data: _/neurolib/examples/data/AAL2_atlas_data/AAL2.nii_
                         _/neurolib/examples/data/AAL2_atlas_data/AAL2.xml_                             
- Computation Script: _/neurolib/neurolib/utils/leadfield.py_

**Dependencies**:
Ensure the independencies **MNE**, **nibabel**, and **matplotlib** are installed. With these prerequisites, the provided Jupyter notebook can be executed to compute the lead-field matrix.

**Paper References**:
[[Conference Paper]](https://www.researchgate.net/publication/374061208_Computation_of_the_lead-field_matrix)

**Acknowledgments**:

- This contribution stems from the Neural Information Processing project carried out at the Technical University of Berlin.
- Collaborative efforts with Orabe Mohammad: @orabe
- Heartfelt gratitude to @caglorithm for the consistent mentorship.

Your review and feedback on this contribution would be greatly appreciated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec2434ecd280`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.