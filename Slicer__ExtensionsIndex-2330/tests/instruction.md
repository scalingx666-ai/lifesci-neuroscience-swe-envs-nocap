# Issue

**Title:** ENH: Add RadReirradiation extension

## Description

<!--
Thank you for contributing to 3D Slicer!
- To add a new extension with this pull request: Please keep content of "New extension" section and put an 'x' in the brackets for each todo item to indicate that you have accomplished that prerequisite.
- To update an existing extension with this pull request: Please delete all text in this template and just describe which extension is updated and optionally tell us in a sentence what has been changed. To make extension updates easier in the future you may consider replacing specific git hash in your json file by a branch name (for example: `main` for Slicer Preview Releases; `(majorVersion).(minorVersion)` such as `5.6` for Slicer Stable Releases).
-->

# RadReirradiation, Radiotherapy - Reirradiation Analysis

<!-- To make sure users can find your extension, understand what it is intended for and how to use it, please complete the checklist below. You do not need to complete all the item by the time you submit the pull request, but most likely the changes will only be merged if all the tasks are done. "Tier" of your extension will be determined based on the set of requirements you fulfill. See more information about the submission process here: https://slicer.readthedocs.io/en/latest/developer_guide/extensions.html.
 -->
Hello Slicer Team,

I'd like to introduce RadReirradiation, a new 3D Slicer extension designed to support clinical reirradiation workflows in radiotherapy.

The extension provides the following features:

• Voxel-by-voxel BED and EQD2 biological dose accumulation, with time-based recovery factors based on the linear-quadratic model.
• An image registration wrapper (Rigid, Affine, and Deformable B-Spline) built on the BRAINSFit engine, with an interactive manual pre-alignment panel and an Auto-Center tool specifically designed to handle CBCT field-of-view discrepancies common in linac-based imaging.
• Automatic resampling of the moving dose grid to match the reference geometry prior to biological accumulation.
• A custom Eclipse-style dose wash colormap (Dark Blue to Red, 2 Gy threshold) for familiar TPS-like visualization.

The extension is implemented in Python, depends on SlicerRT, and has been tested in clinical research scenarios at our institution. A web-based companion tool is also available at radcomp.streamlit.app.

The repository is available at: https://github.com/LuisParedesOcampo/SlicerRadReirradiation

I'm submitting this as a Tier 1 extension. I'm happy to address any feedback from the review process.

Thank you for your time and for maintaining such a valuable platform.

Best regards,
Luis Paredes
Clinical Medical Physicist — Cali, Colombia

Please let me know if there is anything else I need to adjust. Thank you!

## Tier 1

Any extension that is listed in the Extensions Catalog must fulfill these requirements.

- [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for). The extension name should not start with `Slicer` (unless it explicitly provides a bridge between Slicer and a tool or library), because it would make it more difficult to find extensions if the name of many started with the same word.
- [x] Repository name is Slicer+ExtensionName (except if the repository that hosts the extension can be also used without Slicer)
- [x] Repository is associated with `3d-slicer-extension` GitHub topic so that it is listed [here](https://github.com/topics/3d-slicer-extension). To edit topics, click the settings icon in the right side of "About" section header and enter `3d-slicer-extension` in "Topics" and click "Save changes". To learn more about topics, read https://help.github.com/en/articles/about-topics
- [x] Extension description summarizes in 1-2 sentences what the extension is usable (should be understandable for non-experts)
- [x] Any known related patents must be mentioned in the extension description.
- [x] LICENSE.txt is present in the repository root and the name of the license is mentioned in extension homepage. We suggest you use a permissive license that includes patent and contribution clauses. This will help protect developers and ensure the code remains freely available. MIT (https://choosealicense.com/licenses/mit/) or Apache (https://choosealicense.com/licenses/apache-2.0/) license is recommended. Read [here](https://opensource.guide/legal/#which-open-source-license-is-appropriate-for-my-project) to learn more about licenses. If source code license is more restrictive for users than MIT, BSD, Apache, or 3D Slicer license then describe the reason for the license choice and include the name of the used license in the extension description.
- [x] Extension URL and revision (scmurl, scmrevision) is correct, consider using a branch name (main, release, ...) instead of a specific git hash to avoid re-submitting pull request whenever the extension is updated
- [x] Extension icon URL is correct (do not use the icon's webpage but the raw data download URL that you get from the download button - it should look something like this: https://raw.githubusercontent.com/user/repo/main/SomeIcon.png)
- [x] Screenshot URLs (screenshoturls) are correct, contains at least one
- [x] Content of submitted json file is consistent with the top-level CMakeLists.txt file in the repository (dependencies, etc. are the same)
- Homepage URL points to valid webpage containing the following:
  - [x] Extension name
  - [x] Short description: 1-2 sentences, which summarizes what the extension is usable for
  - [x] At least one nice, informative image, that illustrates what the extension can do. It may be a screenshot.
  - [x] Description of contained modules: at one sentence for each module
  - [x] Publication: link to publication and/or to PubMed reference (if available)
- Hide unused github features (such as Wiki, Projects, and Discussions, Releases, Packages) in the repository to reduce noise/irrelevant information:
  - [x] Click `Settings` and in repository settings uncheck `Wiki`, `Projects`, and `Discussions` (if they are currently not used).
  - [x] Click the settings icon next to `About` in the top-right corner of the repository main page and uncheck `Releases` and `Packages` (if they are currently not used)
- The extension is safe:
  - [x] Does not include or download binaries from unreliable sources
  - [x] Does not send any information anywhere without user consent (explicit opt-in is required)

## Tier 3

Community-supported extensions.

- [ ] Documentation, tutorial, and test data are provided for most modules. A tutorial provides step-by-step description of at least the most typical use case, include a few screenshots. Any sample data sets that is used in tutorials must be registered with the Sample Data module to provide easy access to the user.
- [ ] Follows programming and user interface conventions of 3D Slicer (e.g., GUI and logic are separated, usage of popups is minimized, no unnecessary custom GUI styling, etc.)
- [ ] The extension can be successfully built and packaged on all supported platforms (Windows, macOS, Linux)
- [ ] Maintainers respond to issues and pull request submitted to the extension's repository.
- [ ] Maintainers respond to questions directly addressed to him/her via @mention on the [Slicer Forum](https://discourse.slicer.org).
- [ ] Permissive license is used for the main functions of the extension (recommended Apache or MIT). The extension can provide additional functionality in optional components that are distributed with non-permissive license, but the user has to explicitly approve those before using them (e.g., a pop-up can be displayed that explains the licensing terms and the user has to acknowledge them to proceed).
- All requirements of tiers < 3.

## Tier 5

Critically important extensions, supported by Slicer core developers. New Slicer Stable Release is released only if all Tier 5 extension packages are successfully created on all supported platforms.

- [ ] Slicer core developers accept the responsibility of fixing any issues caused by Slicer core changes; at least one Slicer core developer (anyone who has commit right to Slicer core) must be granted commit right to the extension's repository.
- [ ] Automated tests for all critical features.
- [ ] Maintainers respond to questions related to the extension on the [Slicer Forum](https://discourse.slicer.org).
- All requirements of tiers < 5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90932855ebfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.