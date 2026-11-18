# Issue

**Title:** JRC2018Unisex Fly Brain Atlas

## Description

## Description

### What is this PR?

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

### Why is this PR needed?

This PR adds script for packaging the VFB ROI annotation on the JRC2018Unisex fly adult brain template into BrainGlobe format. 

### What does this PR do?

This PR adds `atlas_scripts/jrc2018u_neuropils_fly.py`.

## References

Relates to #471 .

Main atlas/template source:

- [https://www.virtualflybrain.org/blog/2022/01/01/jrc-2018-templates-rois-jrc2018/](https://www.virtualflybrain.org/blog/2022/01/01/jrc-2018-templates-rois-jrc2018/)

Main citation:

Bogovic JA, Otsuna H, Heinrich L, Ito M, Jeter J, et al. (2020) An unbiased template of the Drosophila brain and ventral nerve cord. PLOS ONE 15(12): e0236495. [https://doi.org/10.1371/journal.pone.0236495](https://doi.org/10.1371/journal.pone.0236495)

## How has this PR been tested?



## Is this a breaking change?

No. This PR only adds a new atlas generation script and should not change existing atlas behavior.

## Does this PR require an update to the documentation?

No documentation update has been added in this PR.


## Checklist

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with pre-commit

## Link to the .tar file

https://drive.google.com/file/d/1T0DniDHTzqChrmHZJbStn-zz2R03QRyu/view?usp=sharing

## Some images of the atlas in napari

<img width="1512" height="949" alt="image" src="https://github.com/user-attachments/assets/1b3f6af3-bd7e-4aab-aca1-b74602c8781e" />

<img width="1512" height="949" alt="image" src="https://github.com/user-attachments/assets/6d9e5c6c-f3a5-4c2f-8fed-25e63b4da06b" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9adcdd94778f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.