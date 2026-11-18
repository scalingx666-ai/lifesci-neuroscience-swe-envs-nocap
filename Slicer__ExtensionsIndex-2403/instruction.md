# Issue

**Title:** Add OsteotomyCuts extension

## Description

# New extension

**OsteotomyCuts** — virtual osteotomies for orthognathic and craniofacial surgical planning: osteotomy lines drawn on a bone model are cut along a saw direction with a set blade thickness and depth, several lines can form one osteotomy (e.g. a Le Fort I), cuts can be mirrored across a midline plane, and the bone is divided into closed bone segments, with checks of model quality and of the distance to the nerve canal and tooth roots.

Repository: https://github.com/cmfsx/SlicerOsteotomyCuts — release [v1.0.0](https://github.com/cmfsx/SlicerOsteotomyCuts/releases/tag/v1.0.0).

## Tier 1

Any extension that is listed in the Extensions Catalog must fulfill these requirements.

- [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for). The extension name should not start with `Slicer` (unless it explicitly provides a bridge between Slicer and a tool or library), because it would make it more difficult to find extensions if the name of many started with the same word.
- [x] Repository name is Slicer+ExtensionName (except if the repository that hosts the extension can be also used without Slicer)
- [x] Repository is associated with `3d-slicer-extension` GitHub topic so that it is listed [here](https://github.com/topics/3d-slicer-extension).
- [x] Extension description summarizes in 1-2 sentences what the extension is usable (should be understandable for non-experts)
- [x] Any known related patents must be mentioned in the extension description. *(No related patents are known to the author.)*
- [x] LICENSE.txt is present in the repository root and the name of the license is mentioned in extension homepage. *(The licence file is `LICENSE` in the repository root: GPL-3.0-or-later, named in the README and in the extension description. GPL was chosen so that improvements to this clinical planning tool remain open; a commercial licence is available on request.)*
- [x] Extension URL and revision (scmurl, scmrevision) is correct, consider using a branch name (main, release, ...) instead of a specific git hash to avoid re-submitting pull request whenever the extension is updated *(branch `main`)*
- [x] Extension icon URL is correct (do not use the icon's webpage but the raw data download URL that you get from the download button - it should look something like this: https://raw.githubusercontent.com/user/repo/main/SomeIcon.png)
- [x] Screenshot URLs (screenshoturls) are correct, contains at least one *(three)*
- [x] Content of submitted json file is consistent with the top-level CMakeLists.txt file in the repository (dependencies, etc. are the same)
- Homepage URL points to valid webpage containing the following:
  - [x] Extension name
  - [x] Short description: 1-2 sentences, which summarizes what the extension is usable for
  - [x] At least one nice, informative image, that illustrates what the extension can do. It may be a screenshot.
  - [x] Description of contained modules: at one sentence for each module *(one module, Osteotomy Cuts)*
  - [ ] Publication: link to publication and/or to PubMed reference (if available) *(no journal publication yet; a Zenodo DOI will be added to the README)*
- Hide unused github features (such as Wiki, Projects, and Discussions, Releases, Packages) in the repository to reduce noise/irrelevant information:
  - [x] Click `Settings` and in repository settings uncheck `Wiki`, `Projects`, and `Discussions` (if they are currently not used). *(Wiki, Projects and Discussions are disabled; Issues are enabled.)*
  - [ ] Click the settings icon next to `About` in the top-right corner of the repository main page and uncheck `Releases` and `Packages` (if they are currently not used) *(Releases are used: they are archived by Zenodo for citation.)*
- The extension is safe:
  - [x] Does not include or download binaries from unreliable sources
  - [x] Does not send any information anywhere without user consent (explicit opt-in is required) *(nothing is sent anywhere; the only process the module starts is a local `git rev-parse`, to record the module version on bone segments)*

## Tier 3

Community-supported extensions. *(Not claimed for this first submission.)*

- [ ] Documentation, tutorial, and test data are provided for most modules. *(Documentation, a quick start and examples are in the README and the module help; the tests use synthetic geometry; no sample data are registered.)*
- [ ] Follows programming and user interface conventions of 3D Slicer (e.g., GUI and logic are separated, usage of popups is minimized, no unnecessary custom GUI styling, etc.)
- [ ] The extension can be successfully built and packaged on all supported platforms (Windows, macOS, Linux) *(tested on Windows 11 only)*
- [ ] Maintainers respond to issues and pull request submitted to the extension's repository.
- [ ] Maintainers respond to questions directly addressed to him/her via @mention on the [Slicer Forum](https://discourse.slicer.org).
- [ ] Permissive license is used for the main functions of the extension (recommended Apache or MIT). *(GPL-3.0-or-later)*
- All requirements of tiers < 3.

## Tier 5

Critically important extensions, supported by Slicer core developers. *(Not applicable.)*

- [ ] Slicer core developers accept the responsibility of fixing any issues caused by Slicer core changes; at least one Slicer core developer (anyone who has commit right to Slicer core) must be granted commit right to the extension's repository.
- [ ] Automated tests for all critical features.
- [ ] Maintainers respond to questions related to the extension on the [Slicer Forum](https://discourse.slicer.org).
- All requirements of tiers < 5.

---

Tested on Slicer 5.12.4 stable and 5.13.0 preview, Windows 11. Please also make it available for the 5.12 stable release. Licensed under GPL-3.0-or-later (stated in the extension description).

The extension's validation script (`scripts/check_description_files.py`) passes locally for `OsteotomyCuts.json`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1540c65894f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.