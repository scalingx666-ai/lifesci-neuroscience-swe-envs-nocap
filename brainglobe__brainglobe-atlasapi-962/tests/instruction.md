# Issue

**Title:** LAMBADA Developmental Mouse Atlas

## Description

## Description
This PR packages the LAMBADA Developmental Mouse atlas from de Launoit et al. (2026) into BrainGlobe, and closes Issue #675. 

**What is this PR**

- [ ] Bug fix
- [X] Addition of a new feature
- [ ] Other


## References
Issue #675 
Publication: https://doi.org/10.1016/j.cell.2026.03.013 
Atlas files: https://lambada.icm-institute.org/ 


## Does this PR require an update to the documentation?

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Screenshots: 
`lambada_dev_mouse_p3_25um`:
<img width="2560" height="1368" alt="image" src="https://github.com/user-attachments/assets/e8be57ea-1a61-4c31-8a07-39fe05185448" />

`lambada_dev_mouse_p5_25um`:
<img width="2560" height="1368" alt="image" src="https://github.com/user-attachments/assets/86d67529-f2d7-465b-921c-490d7266697c" />
(The tiny artifacts in the upper corners are from the original data)

`lambada_dev_mouse_p7_25um`:
<img width="2560" height="1368" alt="image" src="https://github.com/user-attachments/assets/130e24b3-3255-4ed4-a0c5-e5bc83207eab" />

`lambada_dev_mouse_p9_25um`:
<img width="2560" height="1368" alt="image" src="https://github.com/user-attachments/assets/c4f87599-1ac4-4c62-a7ef-d7ae6a673d3c" />

`lambada_dev_mouse_p12_25um`:
<img width="2560" height="1368" alt="image" src="https://github.com/user-attachments/assets/df19cb37-9ab2-4aa7-9d18-fdabdb6713a0" />

`lambada_dev_mouse_p14_25um`:
<img width="2560" height="1368" alt="image" src="https://github.com/user-attachments/assets/6ed2b06c-0e61-4699-a231-5ba0188d2b5d" />

`lambada_dev_mouse_p21_25um`:
<img width="2560" height="1368" alt="image" src="https://github.com/user-attachments/assets/f9e77f2f-5ba7-4f7a-84a5-8b51b02c6983" />
(Note artifacts are from the original data)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29a4bfab2f8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.