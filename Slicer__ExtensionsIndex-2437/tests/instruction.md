# Issue

**Title:** Add ThighUSSegmentation extension to Slicer 5.12

## Description

<!--
Thank you for contributing to 3D Slicer!
- To add a new extension with this pull request: Please keep content of "New extension" section and put an 'x' in the brackets for each todo item to indicate that you have accomplished that prerequisite.
- To update an existing extension with this pull request: Please delete all text in this template and just describe which extension is updated and optionally tell us in a sentence what has been changed.
-->

# New extension

## Tier 1

Any extension that is listed in the Extensions Catalog must fulfill these requirements.

- [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for). The extension name should not start with `Slicer` (unless it explicitly provides a bridge between Slicer and a tool or library), because it would make it more difficult to find extensions if the name of many started with the same word.
- [x] Repository name is Slicer+ExtensionName (except if the repository that hosts the extension can be also used without Slicer).
- [x] Repository is associated with `3d-slicer-extension` GitHub topic so that it is listed [[here](https://github.com/topics/3d-slicer-extension)](https://github.com/topics/3d-slicer-extension).
- [x] Extension description summarizes in 1-2 sentences what the extension is usable for (should be understandable for non-experts).
- [x] Any known related patents must be mentioned in the extension description.
- [x] LICENSE.txt is present in the repository root and the name of the license is mentioned in extension homepage. We suggest using a permissive license such as MIT or Apache 2.0.
- [x] Extension URL and revision (scmurl, scmrevision) is correct, using a branch name instead of a specific git hash to avoid re-submitting pull requests whenever the extension is updated.
- [x] Extension icon URL is correct (using the raw data download URL).
- [x] Screenshot URLs (screenshoturls) are correct and contain at least one screenshot.
- [x] Content of submitted JSON file is consistent with the top-level CMakeLists.txt file in the repository (dependencies, etc. are the same).
- Homepage URL points to a valid webpage containing the following:
  - [x] Extension name.
  - [x] Short description: 1-2 sentences summarizing what the extension is usable for.
  - [x] At least one informative image illustrating what the extension can do.
  - [x] Description of contained modules: at least one sentence for each module.
  - [x] Publication: link to publication and/or PubMed reference (if available).
- Hide unused GitHub features (such as Wiki, Projects, Discussions, Releases, Packages) in the repository to reduce noise/irrelevant information:
  - [x] In repository Settings, uncheck Wiki, Projects, and Discussions (if not used).
  - [x] In the About section settings, uncheck Releases and Packages (if not used).
- The extension is safe:
  - [x] Does not include or download binaries from unreliable sources.
  - [x] Does not send any information anywhere without user consent (explicit opt-in is required).

## Tier 3

Community-supported extensions.

- [ ] Documentation, tutorial, and test data are provided for most modules. A tutorial provides a step-by-step description of at least the most typical use case, including a few screenshots. Any sample datasets used in tutorials must be registered with the Sample Data module to provide easy access to the user.
- [ ] Follows programming and user interface conventions of 3D Slicer (e.g., GUI and logic are separated, usage of popups is minimized, no unnecessary custom GUI styling, etc.).
- [ ] The extension can be successfully built and packaged on all supported platforms (Windows, macOS, Linux).
- [ ] Maintainers respond to issues and pull requests submitted to the extension's repository.
- [ ] Maintainers respond to questions directly addressed to them via @mention on the [[Slicer Forum](https://discourse.slicer.org/)](https://discourse.slicer.org).
- [ ] Permissive license is used for the main functions of the extension (recommended Apache or MIT). The extension can provide additional functionality in optional components distributed with non-permissive licenses, but the user must explicitly approve those before using them.
- All requirements of tiers < 3.

## Tier 5

Critically important extensions, supported by Slicer core developers. A new Slicer Stable Release is released only if all Tier 5 extension packages are successfully created on all supported platforms.

- [ ] Slicer core developers accept responsibility for fixing any issues caused by Slicer core changes; at least one Slicer core developer (anyone with commit rights to Slicer core) must be granted commit rights to the extension's repository.
- [ ] Automated tests for all critical features.
- [ ] Maintainers respond to questions related to the extension on the [[Slicer Forum](https://discourse.slicer.org/)](https://discourse.slicer.org).
- All requirements of tiers < 5.

---

## Additional comments

This pull request adds **ThighUSSegmentation** to the **Slicer 5.12 Stable ExtensionsIndex**.

The extension was previously reviewed and approved in ](), which was merged into the main branch on October 29, 2026. It is already available through the Slicer Preview Extension Manager.

This submission reuses the same approved extension descriptor, including the PyTorch build dependency, to make the extension available for Slicer 5.12 Stable.

No changes to the extension source code are introduced in this pull request.

Thank you again for your review and support!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9647a9cf5b98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.