# Issue

**Title:** [New Atlas]: Adding basic bumblebee atlas

## Description

# [New Atlas]: Adding basic bumblebee atlas

> **Note** This is a _very_ rough PR. I'd appreciate some feedback on both the structure and implementation.


**Notes**
Along the way, I noted a couple of small issues that are **not** fixed in this PR. I can work on separately as required:

- Figure out how to correctly represent resolution.

The real resolution is 0.64µm x 0.64µm x 2.542µm but the mesh additions only work when using 1. Further, the naming expects an integer.

- Missing method in wrapup.py: 
 
The current wrap-up script references an instance method that doesn't exist. Specifically, [wrapup.py line 249](https://github.com/brainglobe/brainglobe-atlasapi/blob/main/brainglobe_atlasapi/atlas_generation/wrapup.py#L249) calls `map_resolution` on an `AnatomicalSpace` object, which doesn’t implement that method ([core.py line 30](https://github.com/brainglobe/brainglobe-space/blob/main/brainglobe_space/core.py#L30)).

- Encoding errors in tree files:  

I encountered encoding errors in [create_readme](https://github.com/brainglobe_atlasapi/brainglobe-atlasapi/blob/main/brainglobe_atlasapi/atlas_generation/metadata_utils.py#L85) -- specifically due to tree characters causing I/O failures. Forcing UTF-8 encoding was a sufficient fix here.

- Atlas naming validation:

The atlas naming validation breaks when following the base template (e.g., kocher_bumblebee), since the name does not include a resolution as required [here](https://github.com/Wolfffff/brainglobe-atlasapi/blob/main/brainglobe_atlasapi/atlas_generation/validate_atlases.py#L259).

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

This PR expands BrainGlobe's atlas collection to include the first arthropod species - the common eastern bumblebee (*Bombus impatiens*). This atlas provides coarse annotations of key neuropil regions in the bumblebee brain.

**What does this PR do?**

This PR adds an atlas generation script for the Kocher bumblebee brain atlas, including:

- Downloads VTK mesh and template data from the Kocher lab
- Converts VTK mesh annotations to volumetric TIFF format
- Generates 3D meshes for visualization of 9 brain regions
- Handles coordinate transformations and padding to align annotations with reference template
- Integrates with existing BrainGlobe Atlas API conventions


## How has this PR been tested?

- [x] Script successfully downloads data from remote sources
- [x] VTK to volumetric annotation conversion produces correct output
- [x] Reference and annotation volumes are properly aligned
- [x] All brain regions are correctly segmented and labeled (verified in Napari)
- [x] 3D meshes are generated for all regions including root mesh
- [x] Atlas metadata and structure information follows BrainGlobe conventions
- [ ] Validation of final atlas package structure

**Testing methodology:**
- Local execution of `kocher_bumblebee.py` script
- Verification of downloaded file integrity using SHA256 hashes
- Visual inspection of generated reference annotation volumes
- Validation of structure hierarchy and naming conventions

## Is this a breaking change?

No. Only documentation, a new script, and one dependency.

## Does this PR require an update to the documentation?

Yes, updated README.md.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70c4338a46e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.