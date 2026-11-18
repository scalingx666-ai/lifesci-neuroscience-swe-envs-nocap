# Issue

**Title:** SIGMA v2 Rat Brain Atlas

## Description

## Description

### What is this PR?

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

### Why is this PR needed?

This PR adds the SIGMA v2 Wistar rat anatomical atlases to BrainGlobe. SIGMA provides population-derived MRI templates with Waxholm v4 anatomical annotations registered into the corresponding SIGMA spaces.

### What does this PR do?

Adds one script, `atlas_scripts/sigma_rat.py`, that packages two independent atlases:

| Atlas | Resolution | Primary template | Additional references |
|---|---|---|---|
| `sigma_exvivo_rat_90um` | 90 µm isotropic | Ex-vivo MRI registration reference | None |
| `sigma_invivo_rat_150um` | 150 µm isotropic | In-vivo T2-weighted MRI | GM, WM, and CSF probability maps |

Both atlases:

- Preserve the 222 source annotation IDs and SIGMA region names and colors.
- Use Waxholm v4 acronyms and anatomical hierarchy.
- Include explicit hemisphere maps based on the source physical coordinates.
- Generate 312 meshes, including the root and parent regions, using eight workers.
- Produce AtlasAPI v3 manifests and components at version 3.0.
- Are registered in the atlas-name autocomplete list.

The in-vivo tissue probability maps already match its anatomical grid and require no resampling. They use a fixed uint16 encoding: probability ≈ stored value / 65535. The scale is recorded in the atlas metadata.

The scope of the differing source licensing statements still needs clarification before distributing the atlas data.

## References

Atlas data and v2 documentation:

- [SIGMA v2 on Zenodo](https://zenodo.org/records/10635831)

Main citations:

- [Barrière et al., 2019. The SIGMA rat brain templates and atlases for multimodal MRI data analysis and visualization. Nature Communications.](https://doi.org/10.1038/s41467-019-13575-7)
- [Kleven et al., 2023. Waxholm Space atlas of the rat brain: a 3D atlas supporting data analysis and integration. Nature Methods.](https://doi.org/10.1038/s41592-023-02034-3)

## How has this PR been tested?

- Completed local builds of both atlases, including all meshes.
- Loaded both generated packages through AtlasAPI.
- Verified that packaged annotations and hemisphere maps match the reoriented source data.
- Verified that templates and additional references match the intended source intensity conversions.
- Inspected anatomical overlays and representative ex-vivo meshes.
- Passed Ruff lint and formatting checks, Python compilation, and `git diff --check`.

The in-vivo build reports a `validate_annotation_symmetry` failure. This heuristic compares two fixed voxels around the array centre, which contain different labels in the original source annotation. The packaged annotation preserves those labels exactly, and the explicit hemisphere map is correct. The validation check has not been disabled.

## Is this a breaking change?

No. This PR adds two atlases and their packaging script.

## Does this PR require an update to the documentation?

Yes. Atlas documentation remains to be added.

## Checklist

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with pre-commit

Ruff formatting checks passed; the full pre-commit suite has not been run.

## Link to the atlas files

## Some images of the atlas in napari

<img width="1512" height="949" alt="Image" src="https://github.com/user-attachments/assets/f62a3b02-924c-4838-a6c8-95b169a1b565" />

<img width="1512" height="949" alt="Image" src="https://github.com/user-attachments/assets/1a05cb43-97fd-4c9d-ae6c-7e299c3ef386" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35bca8e5f9bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.