# Issue

**Title:** NMT v2.1 Asymmetric ARM macaque Atlas

## Description

## Description

### What is this PR?

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

### Why is this PR needed?

This PR adds script for packaging the ARM asymmetric 250 um macaque atlas into BrainGlobe format. ARM is a hierarchical whole brain macaque atlas distributed with the asymmetric NMT v2.1 macaque template. This atlas is the combination of CHARM and SARM.

### What does this PR do?

This PR adds `atlas_scripts/nmt_arm_asym_macaque.py`, which packages the asymmetric 250 um NMT v2.1 / ARM atlas.

## References

Relates to #771 and #806

Main atlas/template source:

- https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/nonhuman/macaque_tempatl/template_nmtv2.html
- https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/nonhuman/macaque_tempatl/atlas_sarm.html

Main citation:

Jung et al., 2021. A comprehensive macaque fMRI pipeline and hierarchical atlas. NeuroImage. https://doi.org/10.1016/j.neuroimage.2021.117997
Hartig et al., 2021. The Subcortical Atlas of the Rhesus Macaque (SARM) for neuroimaging. NeuroImage. https://doi.org/10.1016/j.neuroimage.2021.117996"

## How has this PR been tested?

The atlas conversion was tested locally.

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

## Some images of the atlas in napari

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa9094c741ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.