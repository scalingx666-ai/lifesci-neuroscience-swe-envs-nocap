# Issue

**Title:** Add DynamicPET extension

## Description

# New extension

## Tier 1

- [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for). The extension name should not start with `Slicer` (unless it explicitly provides a bridge between Slicer and a tool or library), because it would make it more difficult to find extensions if the name of many started with the same word.
- [x] Repository name is Slicer+ExtensionName (except if the repository that hosts the extension can be also used without Slicer)
- [x] Repository is associated with `3d-slicer-extension` GitHub topic
- [x] Extension description summarizes in 1-2 sentences what the extension is usable for
- [x] Any known related patents are mentioned in the extension description, if applicable
- [x] `LICENSE.txt` is present in the repository root and the license is identified as MIT on the extension homepage
- [x] Extension URL and revision (`scm_url`, `scm_revision`) are correct
- [x] Extension icon URL points to the raw image
- [x] Screenshot URLs are correct and contain at least one screenshot
- [x] Submitted JSON is consistent with the top-level `CMakeLists.txt`, including the SlicerRT dependency

Homepage URL contains:

- [x] Extension name
- [x] Short description
- [x] At least one informative image
- [x] Description of contained modules
- [x] Publication information, where available

Unused GitHub features:

- [x] Wiki, Projects, and Discussions are disabled if unused
- [x] Packages is disabled if unused. Releases are intentionally enabled for beta releases.

The extension is safe:

- [x] Does not include or download binaries from unreliable sources
- [x] Does not send information anywhere without explicit user action/consent

---

## Extension summary

**DynamicPET** is a 3D Slicer extension for dynamic PET analysis, providing
dynamic PET DICOM import, regional and voxel-wise kinetic modeling, parametric
imaging, and dynamic RT Structure Set workflows.

The extension integrates:

- **DynamicPET** for TAC extraction, kinetic modeling, and parametric imaging
- **dPETImporter** for dynamic PET DICOM import and metadata handling
- **dRTImporter** for dynamic RTSTRUCT / temporal segmentation workflows
- **KMAP-CPP**, derived from KMAP-C, as the kinetic-modeling backend

The extension depends on **SlicerRT**.

DynamicPET has been developed and most extensively tested with
**Total-Body dynamic PET data acquired on United Imaging systems**.
Testing with additional scanner vendors, acquisition protocols, and DICOM
implementations is very welcome.

This is a **beta / research software** release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4838440aa875`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.