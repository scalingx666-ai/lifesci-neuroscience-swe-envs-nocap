# Issue

**Title:** JRC2018Unisex Fly VNC Atlas

## Description

## Description

### What is this PR?

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

### Why is this PR needed?

This PR adds script for packaging the VFB ROI annotation on the JRC2018Unisex fly adult ventral nerve cord template into BrainGlobe format. 

### What does this PR do?

This PR adds `atlas_scripts/vfb_jrc2018u_vnc_fly.py`.

## References

Relates to #471 .

Main atlas/template source:

- [https://www.virtualflybrain.org/term/adult-vnc-neuropils-court2020-court2020/](https://www.virtualflybrain.org/term/adult-vnc-neuropils-court2020-court2020/)

Main citation:

Bogovic JA, Otsuna H, Heinrich L, Ito M, Jeter J, et al. (2020) An unbiased template of the Drosophila brain and ventral nerve cord. PLOS ONE 15(12): e0236495. [https://doi.org/10.1371/journal.pone.0236495](https://doi.org/10.1371/journal.pone.0236495)

Court, R., Namiki, S., Armstrong, J. D., Börner, J., Card, G., Costa, M., Dickinson, M., Duch, C., Korff, W., Mann, R., Merritt, D., Murphey, R. K., Seeds, A. M., Shirangi, T., Simpson, J. H., Truman, J. W., Tuthill, J. C., Williams, D. W., & Shepherd, D. (2020). A Systematic Nomenclature for the Drosophila Ventral Nerve Cord. Neuron, 107(6), 1071-1079.e2. [https://doi.org/10.1016/j.neuron.2020.08.005](https://doi.org/10.1016/j.neuron.2020.08.005)


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

https://drive.google.com/file/d/1xaFhw1QiQmDkXKYsQXK_wI9ZFtWbCNFF/view?usp=sharing

## Some images of the atlas in napari

<img width="1512" height="949" alt="image" src="https://github.com/user-attachments/assets/af33f508-e99d-4c55-adf0-215cd949de4f" />

<img width="1512" height="949" alt="image" src="https://github.com/user-attachments/assets/d4a041fa-4f9a-40b6-8493-e3a6343ff6ec" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75ee7ba19865`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.