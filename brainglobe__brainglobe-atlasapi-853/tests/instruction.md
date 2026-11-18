# Issue

**Title:** Danionella cerebrum mixed atlas

## Description

## Description

**What is this PR?**

- [ ] Bug fix
- [x] Addition of a new atlas
- [ ] Other

**Why is this PR needed?**

This PR adds the adult *Danionella cerebrum* mixed reference brain atlas requested in #770 to BrainGlobe.

**What does this PR do?**

This PR adds:

- `atlas_scripts/danionella_cerebrum_mixed.py`
- `danionella_cerebrum_mixed_2.5um` to the atlas-name registry

The packaged atlas contains:

- the `dc_mixed_hhg6@1.0` reference template
- the MECE annotation
- the complete 276-node source hierarchy, including 207 annotated structures
- meshes constructed from the annotation for the full hierarchy
- the same-space structural confocal reflectance image as an additional reference

The atlas has an isotropic resolution of 2.5 µm and uses the source LPS orientation.

The HCR gene-expression channels and auditory/visual functional density maps are intentionally excluded. These data products are better suited to the BrainGlobe Data API rather than the atlas package.

## References



- Preprint: https://doi.org/10.64898/2026.03.09.710483
- Data repository: https://gin.g-node.org/danionella/dc_atlas
- Web viewer: https://atlas.danionella.org/cerebrum/
- Source data license: https://gin.g-node.org/danionella/dc_atlas/src/master/LICENSE

## How has this PR been tested?

The full packaging script completed successfully and produced:

`danionella_cerebrum_mixed_2.5um_v1.0.tar.gz`

The resulting package is approximately 602 MB.

Atlas packaging validated.

## Is this a breaking change?

No. This PR adds a new atlas and does not change existing atlas API behaviour.

## Does this PR require a documentation update?

No.

## Checklist

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with pre-commit

## Link to the atlas package
https://drive.google.com/file/d/1WBP1nQ4prJAbp33z2NTgGjdCgIMHK_HF/view?usp=sharing

## Some images of the atlas in napari

<img width="3248" height="2122" alt="image" src="https://github.com/user-attachments/assets/057b3371-5519-4530-858f-4891fa26c9a3" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7da54cc9346`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.