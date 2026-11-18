# Issue

**Title:** Symmetric NMT CHARM and SARM macaque atlases

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The symmetric CHARM and SARM parcellations are currently available within the combined ARM atlas. This PR adds them as standalone cortical and subcortical macaque atlases, sharing ARM’s existing anatomical templates.

**What does this PR do?**

- Adds `atlas_scripts/nmt_charm_sarm_sym_macaque.py`, closely following the asymmetric CHARM/SARM script in #1034.
- Packages two standalone full-head, 250 µm atlases from NMT v2.1:
  - `nmt_charm_sym_macaque_250um`
  - `nmt_sarm_sym_macaque_250um`
- Reuses the published symmetric ARM main template, skull-stripped reference, and coordinate space at version 3.0.
- Preserves native names, acronyms, colours, and hierarchy, using the finest annotation level.
- Merges left/right annotation labels and regional meshes into bilateral structures.
- Uses symmetric hemisphere handling, matching symmetric ARM.
- Uses a cortical root mesh for CHARM and a subcortical root mesh for SARM.
- Registers both atlas names in `brainglobe_atlasapi/atlas_name.py`.

## References

- Asymmetric CHARM/SARM packaging: #1034.
- Symmetric ARM atlas: #806.
- Earlier symmetric CHARM packaging: #792.
- Repair of the shared symmetric ARM template: #1033.
- [NMT source documentation](https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/nonhuman/macaque_tempatl/template_nmtv2.html).
- [Jung et al., 2021 — A comprehensive macaque fMRI pipeline and hierarchical atlas](https://doi.org/10.1016/j.neuroimage.2021.117997).
- [Hartig et al., 2021 — The Subcortical Atlas of the Rhesus Macaque](https://doi.org/10.1016/j.neuroimage.2021.117996).

## How has this PR been tested?

Both atlases were built locally using the `bg-v3` environment.

Smoke checks using the downloaded symmetric source data covered:
- Template, annotation, and skull-stripped reference dimensions and voxel-grid alignment.
- Native terminology, colours, unique acronyms, and hierarchy consistency for 237 CHARM structures and 326 SARM structures.
- Bilateral source-mesh coverage for all non-root structures.
- Shared ARM component names and versions, download configuration, and symmetric hemisphere handling.
- Ruff, Black, and Python syntax checks.

No existing atlas scripts or core API functionality were modified. No permanent unit or integration tests were added.

AI tools assisted with adapting the asymmetric script and running the smoke checks.

## Is this a breaking change?

No. This adds one packaging script and two atlas-name registry entries.

## Does this PR require an update to the documentation?

The atlas listing/documentation should be updated when these atlases are published. No documentation changes or associated documentation PR are included yet.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Screenshots

<img width="1512" height="949" alt="image" src="https://github.com/user-attachments/assets/b40108ae-c189-4c3c-ac57-5b25f081afbf" />

<img width="1512" height="949" alt="image" src="https://github.com/user-attachments/assets/e1017105-649d-426b-bf56-010db7130b0e" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e870e70993db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.