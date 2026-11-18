# Issue

**Title:** Add SlicerDBSCoalignment extension

## Description

Adding DBS Coalignment project to coalign MER signals within STN for PD surgeries

---

# New extension

<!-- To make sure users can find your extension, understand what it is intended for and how to use it, please complete the checklist below. You do not need to complete all the item by the time you submit the pull request, but most likely the changes will only be merged if all the tasks are done. "Tier" of your extension will be determined based on the set of requirements you fulfill. See more information about the submission process here: https://slicer.readthedocs.io/en/latest/developer_guide/extensions.html.
 -->


## Tier 1

Any extension that is listed in the Extensions Catalog must fulfill these requirements.

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

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f20af7cacf7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.