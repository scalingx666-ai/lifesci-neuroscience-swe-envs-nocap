# Issue

**Title:** Adding ATLAS extension to the catalogue

## Description

This pull request adds **ATLAS** to the official 3D Slicer Extensions Catalog.

ATLAS provides workflows for constructing 3D anatomical atlases and statistical shape models and for automatically transferring landmarks to new surface models. It combines rigid surface registration, shape-model-guided deformable registration, and optional surface projection.

# New extension

## Tier 1

Any extension that is listed in the Extensions Catalog must fulfill these requirements.

* [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for). The extension name should not start with `Slicer` unless it explicitly provides a bridge between Slicer and another tool or library.
* [x] Repository name is Slicer+ExtensionName, except if the repository also hosts software that can be used without Slicer.
* [x] Repository is associated with the `3d-slicer-extension` GitHub topic.
* [x] Extension description summarizes in one or two sentences what the extension is usable for and is understandable to non-experts.
* [x] Any known related patents are mentioned.

  * No related patents are known.
* [x] `LICENSE.txt` is present in the repository root and the extension homepage identifies the license.

  * ATLAS is distributed under the BSD 2-Clause License.
* [x] Extension URL and revision are correct.

  * The catalog entry tracks the `main` branch.
* [x] Extension icon URL is a valid raw-content URL.
* [x] Screenshot URL is a valid raw-content URL and contains an informative screenshot.
* [x] The submitted JSON file is consistent with the top-level `CMakeLists.txt`.

  * ATLAS has no required Slicer extension dependencies. SlicerMorph is complementary but optional.

The homepage contains:

* [x] Extension name.
* [x] A short description summarizing the extension’s purpose.
* [x] At least one informative image illustrating the extension.
* [x] A description of each contained module: BUILDER, DATABASE, PREDICT, and SEGMENTATION.
* [x] Publication information, if available.

  * The ATLAS manuscript is in preparation. The repository citation and relevant underlying software citations are provided.

Unused GitHub features:

* [x] Wiki, Projects, and Discussions are disabled if unused.
* [x] Releases and Packages are hidden if unused.

The extension is safe:

* [x] It does not include or download binaries from unreliable sources.

  * PREDICT can install the Python packages `tiny3d` and `biocpd` from the configured Python package index after explicit user approval.
* [x] It does not send information anywhere without user consent.

  * Processing is local, and ATLAS does not upload models, landmarks, or other user data.

## Tier 3

ATLAS is being submitted initially as a Tier 1 extension.

* [ ] Documentation, tutorial, and test data are provided for most modules.
* [ ] Follows programming and user interface conventions of 3D Slicer.
* [ ] The extension can be successfully built and packaged on all supported platforms.
* [ ] Maintainers respond to issues and pull requests submitted to the extension repository.
* [ ] Maintainers respond to questions addressed to them on the Slicer Forum.
* [x] A permissive license is used for the main extension functions.

  * ATLAS uses the BSD 2-Clause License.

## Tier 5

ATLAS is not being submitted as a Tier 5 extension.

* [ ] A Slicer core developer accepts responsibility for fixing issues caused by Slicer core changes and has commit access to the extension repository.
* [ ] Automated tests cover all critical features.
* [ ] Maintainers provide Tier 5 support through the Slicer Forum.

## Additional information

* ATLAS was tested in a clean 3D Slicer installation.
* BUILDER, DATABASE, PREDICT, and SEGMENTATION loaded successfully.
* Runtime Python dependency installation was tested.
* SlicerMorph is not required and is therefore not listed as a build dependency.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcc81a04ac92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.