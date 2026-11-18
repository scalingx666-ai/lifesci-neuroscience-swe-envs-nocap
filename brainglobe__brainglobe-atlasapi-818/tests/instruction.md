# Issue

**Title:** Duke Mouse Brain Atlas

## Description

## Description

### What is this PR?

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

### Why is this PR needed?

This PR adds a script for packaging the Duke Mouse Brain Atlas (DMBA), a 15 µm MRI-based stereotaxic mouse brain atlas, into BrainGlobe format.

### What does this PR do?

This PR:

- Adds `atlas_scripts/duke_mouse.py`.
- Uses mean diffusivity (MD) as the primary anatomical reference.
- Generates meshes for all atlas structures.
- Includes additional MR contrasts: AD, DWI, NQA, RD, FA, M0, M1, M2, M3, ISO, and unmasked mGRE.
- Includes combined bregma-indexed stereotaxic grids at 0.2 mm and 1 mm spacing.

## References

Relates to #569 .

Main atlas/template source:

- [Duke CIVMImageSpace: Duke Mouse Brain Atlas](https://civmimagespace.civm.duhs.duke.edu/tp_item_detail.php/view/item_number=DMBA/set_id=315)

Main citation:

Mansour H, Azrak R, Cook JJ, Hornburg KJ, Qi Y, Tian Y, Williams RW, Yeh F-C, White LE, Johnson GA (2025). The Duke Mouse Brain Atlas: MRI and light sheet microscopy stereotaxic atlas of the mouse brain. *Science Advances* 11, eadq8089. [https://doi.org/10.1126/sciadv.adq8089](https://doi.org/10.1126/sciadv.adq8089)

## How has this PR been tested?

- The core atlas was generated locally with 270 structure meshes.

## Is this a breaking change?

No. This PR only adds a new atlas generation script and atlas name and should not change existing atlas behavior.

## Does this PR require an update to the documentation?

No documentation update has been added in this PR.

## Checklist

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with pre-commit

## Link to the .tar file

https://drive.google.com/file/d/1w7VrikAhxZLn5Ufjrb-EKy-VcKX0Vwqe/view?usp=sharing

## Some images of the atlas in napari

<img width="1580" height="1017" alt="image" src="https://github.com/user-attachments/assets/bdba26ac-3d68-47d9-8bb4-2c3edea29ac4" />

<img width="1624" height="1061" alt="image" src="https://github.com/user-attachments/assets/f448b24c-744d-46ff-aed3-703306e22acf" />

<img width="1624" height="1061" alt="image" src="https://github.com/user-attachments/assets/652b82fb-6121-45f6-a374-5373a0421f8f" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f997c22249e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.