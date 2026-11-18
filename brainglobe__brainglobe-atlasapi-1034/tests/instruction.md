# Issue

**Title:** Asymmetric NMT CHARM and SARM macaque atlases

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The asymmetric CHARM and SARM parcellations are currently available within the combined ARM atlas. This PR adds them as standalone cortical and subcortical macaque atlases, sharing ARM’s existing anatomical templates.

**What does this PR do?**

- Adds `atlas_scripts/nmt_charm_sarm_asym_macaque.py`, based on the existing asymmetric ARM script.
- Packages two standalone full-head, 250 µm atlases from NMT v2.1:
  - `nmt_charm_asym_macaque_250um`
  - `nmt_sarm_asym_macaque_250um`
- Reuses the published ARM asymmetric main template, skull-stripped reference, and coordinate space at version 3.0.
- Preserves native names, acronyms, colours, and hierarchy, using the finest annotation level.
- Merges left/right annotation labels and regional meshes while retaining ARM’s source hemisphere-map behaviour.
- Uses a cortical root mesh for CHARM and a subcortical root mesh for SARM.
- Registers both atlas names in `brainglobe_atlasapi/atlas_name.py`.

## References

- Related asymmetric ARM atlas: #947.
- [NMT source documentation](https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/nonhuman/macaque_tempatl/template_nmtv2.html).
- [Jung et al., 2021 — A comprehensive macaque fMRI pipeline and hierarchical atlas](https://doi.org/10.1016/j.neuroimage.2021.117997).
- [Hartig et al., 2021 — The Subcortical Atlas of the Rhesus Macaque](https://doi.org/10.1016/j.neuroimage.2021.117996).

## How has this PR been tested?

Both atlases were built locally using the `bg-v3` environment and loaded through AtlasAPI.

Checks covered:
- Template, annotation, additional-reference, and hemisphere-map alignment.
- Native terminology, colours, unique acronyms, and shared ARM component references.
- All 237 CHARM meshes and 326 SARM meshes.
- Sampled root, parent, and leaf masks, including descendant regions.
- Ruff, Black, and Python syntax checks.

No existing atlas scripts or core API functionality were modified. No permanent unit or integration tests were added.

AI tools assisted with adapting the ARM script and validating the outputs.

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
<img width="3024" height="1898" alt="image" src="https://github.com/user-attachments/assets/d757753b-1a6e-4cb6-8a39-7c0bbdf3adac" />
<img width="3024" height="1898" alt="image" src="https://github.com/user-attachments/assets/5463bd9e-bb7e-42c0-9938-a12f3fa6085a" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1a5f40591d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.